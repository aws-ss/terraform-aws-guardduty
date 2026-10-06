resource "aws_guardduty_detector" "this" {
  region                       = var.region
  enable                       = var.enable
  finding_publishing_frequency = var.finding_publishing_frequency

  tags = var.tags
}
