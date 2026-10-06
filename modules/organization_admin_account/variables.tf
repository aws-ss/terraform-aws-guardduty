variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "admin_account_id" {
  description = "(Required) AWS account identifier to designate as a delegated administrator for GuardDuty."
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.admin_account_id))
    error_message = "admin_account_id must be a 12-digit AWS account ID."
  }
}