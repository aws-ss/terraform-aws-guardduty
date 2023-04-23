variable "account_id" {
  description = "(Required) AWS account ID for member account."
  type        = string
}

variable "detector_id" {
  description = "(Required) The detector ID of the GuardDuty account where you want to create member accounts."
  type        = string
}

variable "email" {
  description = "(Required) Email address for member account."
  type        = string
}

variable "invite" {
  description = "(Optional) Boolean whether to invite the account to GuardDuty as a member."
  type        = bool
  default     = false
}

variable "invitation_message" {
  description = "(Optional) Message for invitation."
  type        = string
  default     = null
}

variable "disable_email_notification" {
  description = "Optional) Boolean whether an email notification is sent to the accounts."
  type        = bool
  default     = false
}