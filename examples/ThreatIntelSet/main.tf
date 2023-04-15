provider "aws" {
  region = "ap-northeast-2"
}

module "threat_intel_set" {
  source = "../../modules/threatintelset//"

  activate    = true
  detector_id = ""
  format      = "TXT"
  location    = ""
  name        = "ThreatIntelSet"
  tags = {
    Team  = "Security"
    Owner = "Security"
  }
}