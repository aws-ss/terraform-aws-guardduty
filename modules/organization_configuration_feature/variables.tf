variable "region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "detector_id" {
  description = "(Required) The ID of the detector that configures the delegated administrator."
  type        = string
}

variable "name" {
  description = "(Required) The name of the feature that will be configured for the organization. Valid values: S3_DATA_EVENTS, EKS_AUDIT_LOGS, EBS_MALWARE_PROTECTION, RDS_LOGIN_EVENTS, EKS_RUNTIME_MONITORING, LAMBDA_NETWORK_LOGS, RUNTIME_MONITORING, AI_PROTECTION, AI_ANALYST. Only one of two features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING can be added, adding both features will cause an error."
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

variable "auto_enable" {
  description = "(Required) The status of the feature that is configured for the member accounts within the organization. Valid values: NEW, ALL, NONE."
  type        = string

  validation {
    condition     = contains(["NEW", "ALL", "NONE"], var.auto_enable)
    error_message = "auto_enable must be one of NEW, ALL, NONE."
  }
}

variable "additional_configuration" {
  description = "(Optional) Additional feature configuration block for features EKS_RUNTIME_MONITORING or RUNTIME_MONITORING. name: (Required) The name of the additional configuration for a feature that will be configured for the organization. Valid values: EKS_ADDON_MANAGEMENT, ECS_FARGATE_AGENT_MANAGEMENT, EC2_AGENT_MANAGEMENT. auto_enable: (Required) The status of the additional configuration that will be configured for the organization. Valid values: NEW, ALL, NONE."
  type = list(object({
    name        = string
    auto_enable = string
  }))
  default = []

  validation {
    condition     = alltrue([for c in var.additional_configuration : contains(["EKS_ADDON_MANAGEMENT", "ECS_FARGATE_AGENT_MANAGEMENT", "EC2_AGENT_MANAGEMENT"], c.name)])
    error_message = "additional_configuration name must be one of EKS_ADDON_MANAGEMENT, ECS_FARGATE_AGENT_MANAGEMENT, EC2_AGENT_MANAGEMENT."
  }

  validation {
    condition     = alltrue([for c in var.additional_configuration : contains(["NEW", "ALL", "NONE"], c.auto_enable)])
    error_message = "additional_configuration auto_enable must be one of NEW, ALL, NONE."
  }
}
