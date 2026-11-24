provider "aws" {
  region = "ap-northeast-2"
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

locals {
  bucket_name = "amzn-s3-demo-bucket"
  # kms_key_arn = "arn:aws:kms:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}

module "detector" {
  source = "../..//"

  enable                       = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"
}

module "detector_feature_s3_data_events" {
  source = "../../modules/detector_feature//"

  detector_id = module.detector.guardduty_id
  name        = "S3_DATA_EVENTS"
  status      = "ENABLED"
}

module "detector_feature_runtime_monitoring" {
  source = "../../modules/detector_feature//"

  detector_id = module.detector.guardduty_id
  name        = "RUNTIME_MONITORING"
  status      = "ENABLED"

  additional_configuration = [
    {
      name   = "EKS_ADDON_MANAGEMENT"
      status = "ENABLED"
    },
    {
      name   = "ECS_FARGATE_AGENT_MANAGEMENT"
      status = "ENABLED"
    },
    {
      name   = "EC2_AGENT_MANAGEMENT"
      status = "DISABLED"
    },
  ]
}

module "filter_archive_low_severity" {
  source = "../../modules/filter//"

  detector_id = module.detector.guardduty_id
  name        = "ARCHIVE_LOW_SEVERITY"
  description = "Automatically archive findings with severity below 4 (Low)."
  action      = "ARCHIVE"
  rank        = 1

  finding_criteria = [
    {
      field     = "severity"
      less_than = "4"
    }
  ]
}

module "filter_high_severity_exclude_s3" {
  source = "../../modules/filter//"

  detector_id = module.detector.guardduty_id
  name        = "HIGH_SEVERITY_EXCLUDE_S3"
  description = "Saved view of High severity findings in ap-northeast-2 excluding S3 bucket findings."
  action      = "NOOP"
  rank        = 2

  finding_criteria = [
    {
      field  = "region"
      equals = ["ap-northeast-2"]
    },
    {
      field      = "resource.resourceType"
      not_equals = ["S3Bucket"]
    },
    {
      field                 = "severity"
      greater_than_or_equal = "7"
    }
  ]

  tags = {
    Name = "HIGH_SEVERITY_EXCLUDE_S3"
  }
}

data "aws_iam_policy_document" "malware_protection" {
  statement {
    sid    = "AllowManagedRuleToSendS3EventsToGuardDuty"
    effect = "Allow"
    actions = [
      "events:PutRule",
      "events:DeleteRule",
      "events:PutTargets",
      "events:RemoveTargets",
    ]
    resources = ["arn:aws:events:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:rule/DO-NOT-DELETE-AmazonGuardDutyMalwareProtectionS3*"]

    condition {
      test     = "StringLike"
      variable = "events:ManagedBy"
      values   = ["malware-protection-plan.guardduty.amazonaws.com"]
    }
  }

  statement {
    sid    = "AllowGuardDutyToMonitorEventBridgeManagedRule"
    effect = "Allow"
    actions = [
      "events:DescribeRule",
      "events:ListTargetsByRule",
    ]
    resources = ["arn:aws:events:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:rule/DO-NOT-DELETE-AmazonGuardDutyMalwareProtectionS3*"]
  }

  statement {
    sid    = "AllowPostScanTag"
    effect = "Allow"
    actions = [
      "s3:PutObjectTagging",
      "s3:GetObjectTagging",
      "s3:PutObjectVersionTagging",
      "s3:GetObjectVersionTagging",
    ]
    resources = ["arn:aws:s3:::${local.bucket_name}/*"]
  }

  statement {
    sid    = "AllowEnableS3EventBridgeEvents"
    effect = "Allow"
    actions = [
      "s3:PutBucketNotification",
      "s3:GetBucketNotification",
    ]
    resources = ["arn:aws:s3:::${local.bucket_name}"]
  }

  statement {
    sid       = "AllowPutValidationObject"
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${local.bucket_name}/malware-protection-resource-validation-object"]
  }

  statement {
    sid       = "AllowCheckBucketOwnership"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${local.bucket_name}"]
  }

  statement {
    sid    = "AllowMalwareScan"
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
    ]
    resources = ["arn:aws:s3:::${local.bucket_name}/*"]
  }

  # statement {
  #   sid    = "AllowDecryptForMalwareScan"
  #   effect = "Allow"
  #   actions = [
  #     "kms:GenerateDataKey",
  #     "kms:Decrypt",
  #   ]
  #   resources = [local.kms_key_arn]
  #
  #   condition {
  #     test     = "StringLike"
  #     variable = "kms:ViaService"
  #     values   = ["s3.${data.aws_region.current.region}.amazonaws.com"]
  #   }
  # }
}

module "malware_protection_plan" {
  source = "../../modules/malware_protection_plan//"

  bucket_name     = local.bucket_name
  object_prefixes = ["uploads/"]
  tagging_status  = "ENABLED"

  create_iam_role = true
  iam_role_name   = "soc-GuardDutyS3MalwareScanRole"
  iam_role_policy = data.aws_iam_policy_document.malware_protection.json
}
