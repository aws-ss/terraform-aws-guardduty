resource "aws_guardduty_organization_configuration_feature" "this" {
  region      = var.region
  detector_id = var.detector_id
  name        = var.name
  auto_enable = var.auto_enable

  dynamic "additional_configuration" {
    for_each = var.additional_configuration
    content {
      name        = additional_configuration.value.name
      auto_enable = additional_configuration.value.auto_enable
    }
  }

  lifecycle {
    precondition {
      condition     = length(var.additional_configuration) == 0 || contains(["EKS_RUNTIME_MONITORING", "RUNTIME_MONITORING"], var.name)
      error_message = "additional_configuration can only be set when name is EKS_RUNTIME_MONITORING or RUNTIME_MONITORING."
    }
  }
}
