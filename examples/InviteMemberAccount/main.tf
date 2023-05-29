provider "aws" {
  region = "ap-northeast-2"
}

module "guardduty_member" {
  source = "../../modules/member//"

  account_id         = ""
  detector_id        = ""
  email              = ""
  invite             = true
  invitation_message = "Please join GuardDuty"
}