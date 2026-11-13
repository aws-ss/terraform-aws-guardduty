variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "detector_id" {
  description = "(Required) ID of a GuardDuty detector, attached to your account."
  type        = string
}

variable "name" {
  description = "(Required) The name of your filter."
  type        = string
}

variable "description" {
  description = "(Optional) Description of the filter."
  type        = string
  default     = null
}

variable "action" {
  description = "(Required) Specifies the action that is to be applied to the findings that match the filter. Valid values: NOOP, ARCHIVE."
  type        = string

  validation {
    condition     = contains(["NOOP", "ARCHIVE"], var.action)
    error_message = "action must be one of NOOP, ARCHIVE."
  }
}

variable "rank" {
  description = "(Required) Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings."
  type        = number
}

variable "finding_criteria" {
  description = "(Required) Criterion blocks that represent the criteria to be used in the filter for querying findings. field is required, and each criterion supports equals, not_equals, matches, not_matches (lists of strings) and greater_than, greater_than_or_equal, less_than, less_than_or_equal (strings)."
  type = list(object({
    field                 = string
    equals                = optional(list(string))
    not_equals            = optional(list(string))
    greater_than          = optional(string)
    greater_than_or_equal = optional(string)
    less_than             = optional(string)
    less_than_or_equal    = optional(string)
    matches               = optional(list(string))
    not_matches           = optional(list(string))
  }))

  validation {
    condition     = length(var.finding_criteria) > 0
    error_message = "finding_criteria must contain at least one criterion."
  }
}

variable "tags" {
  description = "(Optional) Key-value map of resource tags."
  type        = map(string)
  default     = null
}
