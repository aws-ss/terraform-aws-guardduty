variable "auto_enable" {
  description = "(Required) When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region."
  type        = bool
}

variable "detector_id" {
  description = "(Required) The detector ID of the GuardDuty account."
  type        = string
}

variable "datasources" {
  description = "(Optional) Configuration for the collected datasources."
  type        = map(string)
  default     = null
}