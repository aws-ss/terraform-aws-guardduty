variable "activate" {
  description = "(Required) Specifies whether GuardDuty is to start using the uploaded IPSet."
  type        = bool
}

variable "detector_id" {
  description = "(Required) The detector ID of the GuardDuty."
  type        = string
}

variable "format" {
  description = "(Required) The format of the file that contains the IPSet. Valid values: TXT, STIX, OTX_CSV, ALIEN_VAULT, PROOF_POINT, FIRE_EYE."
  type        = string

  validation {
    condition     = contains(["TXT", "STIX", "OTX_CSV", "ALIEN_VAULT", "PROOF_POINT", "FIRE_EYE"], var.format)
    error_message = "format must be one of TXT, STIX, OTX_CSV, ALIEN_VAULT, PROOF_POINT, FIRE_EYE."
  }
}

variable "location" {
  description = "(Required) The URI of the file that contains the IPSet."
  type        = string
}

variable "name" {
  description = "(Required) The friendly name to identify the IPSet."
  type        = string
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}