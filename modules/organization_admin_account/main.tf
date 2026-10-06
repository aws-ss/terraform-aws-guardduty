resource "aws_guardduty_organization_admin_account" "this" {
  region           = var.region
  admin_account_id = var.admin_account_id
}