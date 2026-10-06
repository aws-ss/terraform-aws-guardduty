<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_guardduty_organization_configuration_feature.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_additional_configuration"></a> [additional\_configuration](#input\_additional\_configuration) | (Optional) Additional feature configuration block for features EKS\_RUNTIME\_MONITORING or RUNTIME\_MONITORING. name: (Required) The name of the additional configuration for a feature that will be configured for the organization. Valid values: EKS\_ADDON\_MANAGEMENT, ECS\_FARGATE\_AGENT\_MANAGEMENT, EC2\_AGENT\_MANAGEMENT. auto\_enable: (Required) The status of the additional configuration that will be configured for the organization. Valid values: NEW, ALL, NONE. | <pre>list(object({<br/>    name        = string<br/>    auto_enable = string<br/>  }))</pre> | `[]` | no |
| <a name="input_auto_enable"></a> [auto\_enable](#input\_auto\_enable) | (Required) The status of the feature that is configured for the member accounts within the organization. Valid values: NEW, ALL, NONE. | `string` | n/a | yes |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) The ID of the detector that configures the delegated administrator. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the feature that will be configured for the organization. Valid values: S3\_DATA\_EVENTS, EKS\_AUDIT\_LOGS, EBS\_MALWARE\_PROTECTION, RDS\_LOGIN\_EVENTS, EKS\_RUNTIME\_MONITORING, LAMBDA\_NETWORK\_LOGS, RUNTIME\_MONITORING, AI\_PROTECTION, AI\_ANALYST. Only one of two features EKS\_RUNTIME\_MONITORING or RUNTIME\_MONITORING can be added, adding both features will cause an error. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->