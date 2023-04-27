variable "detector_id" {
  description = "(Required) The detector ID of the member GuardDuty account."
  type        = string
}

variable "master_account_id" {
  description = "(Required) AWS account ID for primary account."
  type        = string
}