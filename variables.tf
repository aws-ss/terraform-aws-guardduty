variable "enable" {
  description = "(Required) Enable monitoring and feedback reporting. Setting to false is equivalent to 'suspending' GuardDuty."
  type        = string
}

variable "finding_publishing_frequency" {
  description = "(Optional) Specifies the frequency of notifications sent for subsequent finding occurrences."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Map of key-value pairs to associate with the resource."
  type        = map(string)
  default     = null
}