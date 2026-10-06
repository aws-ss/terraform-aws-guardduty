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
