variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "detector_id" {
  description = "(Required) Amazon GuardDuty detector ID."
  type        = string
}

variable "name" {
  description = "(Required) The name of the detector feature. Valid values: S3_DATA_EVENTS, EKS_AUDIT_LOGS, EBS_MALWARE_PROTECTION, RDS_LOGIN_EVENTS, EKS_RUNTIME_MONITORING, LAMBDA_NETWORK_LOGS, RUNTIME_MONITORING, AI_PROTECTION, AI_ANALYST. Only one of two features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING can be added, adding both features will cause an error."
  type        = string

  validation {
    condition = contains([
      "S3_DATA_EVENTS",
      "EKS_AUDIT_LOGS",
      "EBS_MALWARE_PROTECTION",
      "RDS_LOGIN_EVENTS",
      "EKS_RUNTIME_MONITORING",
      "LAMBDA_NETWORK_LOGS",
      "RUNTIME_MONITORING",
      "AI_PROTECTION",
      "AI_ANALYST",
    ], var.name)
    error_message = "name must be one of S3_DATA_EVENTS, EKS_AUDIT_LOGS, EBS_MALWARE_PROTECTION, RDS_LOGIN_EVENTS, EKS_RUNTIME_MONITORING, LAMBDA_NETWORK_LOGS, RUNTIME_MONITORING, AI_PROTECTION, AI_ANALYST."
  }
}

variable "status" {
  description = "(Required) The status of the detector feature. Valid values: ENABLED, DISABLED."
  type        = string

  validation {
    condition     = contains(["ENABLED", "DISABLED"], var.status)
    error_message = "status must be one of ENABLED, DISABLED."
  }
}

variable "additional_configuration" {
  description = "(Optional) Additional feature configuration blocks for features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING. name: EKS_ADDON_MANAGEMENT, ECS_FARGATE_AGENT_MANAGEMENT, EC2_AGENT_MANAGEMENT. status: ENABLED, DISABLED."
  type = list(object({
    name   = string
    status = string
  }))
  default = []

  validation {
    condition     = alltrue([for c in var.additional_configuration : contains(["EKS_ADDON_MANAGEMENT", "ECS_FARGATE_AGENT_MANAGEMENT", "EC2_AGENT_MANAGEMENT"], c.name)])
    error_message = "additional_configuration name must be one of EKS_ADDON_MANAGEMENT, ECS_FARGATE_AGENT_MANAGEMENT, EC2_AGENT_MANAGEMENT."
  }

  validation {
    condition     = alltrue([for c in var.additional_configuration : contains(["ENABLED", "DISABLED"], c.status)])
    error_message = "additional_configuration status must be one of ENABLED, DISABLED."
  }
}
