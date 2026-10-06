variable "detector_id" {
  description = "(Required) The detector ID of the member GuardDuty account."
  type        = string
}

variable "master_account_id" {
  description = "(Required) AWS account ID for primary account."
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.master_account_id))
    error_message = "master_account_id must be a 12-digit AWS account ID."
  }
}