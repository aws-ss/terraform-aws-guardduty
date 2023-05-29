provider "aws" {
  region = "ap-northeast-2"
}

module "guardduty_organization_admin_account" {
  source = "../../modules/organization_admin_account//"

  admin_account_id = ""
}