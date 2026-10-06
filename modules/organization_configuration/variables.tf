variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "auto_enable_organization_members" {
  description = "(Required) Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values: ALL, NEW, NONE."
  type        = string

  validation {
    condition     = contains(["ALL", "NEW", "NONE"], var.auto_enable_organization_members)
    error_message = "auto_enable_organization_members must be one of ALL, NEW, NONE."
  }
}

variable "detector_id" {
  description = "(Required) The detector ID of the GuardDuty account."
  type        = string
}
