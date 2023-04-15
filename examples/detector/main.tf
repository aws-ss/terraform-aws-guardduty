provider "aws" {
  region = "ap-northeast-2"
}

module "guardduty" {
  source = "../..//"

  enable = true
  datasources = {
    s3_logs               = true
    kubernetes_audit_logs = false
    malware_protection    = true
  }
  tags = {
    Team  = "Security"
    Owner = "Security"
  }
}