variable "activate" {
  description = "(Required) Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet."
  type        = bool
}

variable "detector_id" {
  description = "(Required) The detector ID of the GuardDuty."
  type        = string
}

variable "format" {
  description = "(Required) The format of the file that contains the ThreatIntelSet."
  type        = string
}

variable "location" {
  description = "(Required) The URI of the file that contains the ThreatIntelSet."
  type        = string
}

variable "name" {
  description = "(Required) The friendly name to identify the ThreatIntelSet."
  type        = string
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}