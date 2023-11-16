# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector_feature

variable "detector_id" {
  description = "(Required) Amazon GuardDuty detector ID."
  type        = string
}

variable "name" {
  description = "(Required) The name of the detector feature."
  type        = string
}

variable "status" {
  description = "(Required) The status of the detector feature."
  type        = string
}

variable "additional_configuration" {
  description = "(Optional) Additional feature configuration block."
  type        = map(string)
  default     = {}
}