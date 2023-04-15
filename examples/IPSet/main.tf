provider "aws" {
  region = "ap-northeast-2"
}

module "ip_set" {
  source = "../../modules/ipset//"

  activate    = true
  detector_id = ""
  format      = "TXT"
  location    = ""
  name        = "IPSet"
  tags = {
    Team  = "Security"
    Owner = "Security"
  }
}