resource "aws_guardduty_detector_feature" "this" {
  detector_id = var.detector_id
  name        = var.name
  status      = var.status

  dynamic "additional_configuration" {
    for_each = var.additional_configuration == null ? [] : [var.additional_configuration]
    content {
      name   = lookup(additional_configuration.value, "name")
      status = lookup(additional_configuration.value, "status")
    }
  }
}