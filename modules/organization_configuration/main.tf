resource "aws_guardduty_organization_configuration" "this" {
  region                           = var.region
  auto_enable_organization_members = var.auto_enable_organization_members
  detector_id                      = var.detector_id
}