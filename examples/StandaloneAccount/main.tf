provider "aws" {
  region = "ap-northeast-2"
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
