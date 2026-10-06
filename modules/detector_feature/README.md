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
| [aws_guardduty_detector_feature.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector_feature) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_additional_configuration"></a> [additional\_configuration](#input\_additional\_configuration) | (Optional) Additional feature configuration blocks for features EKS\_RUNTIME\_MONITORING or RUNTIME\_MONITORING. name: EKS\_ADDON\_MANAGEMENT, ECS\_FARGATE\_AGENT\_MANAGEMENT, EC2\_AGENT\_MANAGEMENT. status: ENABLED, DISABLED. | <pre>list(object({<br/>    name   = string<br/>    status = string<br/>  }))</pre> | `[]` | no |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) Amazon GuardDuty detector ID. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the detector feature. Valid values: S3\_DATA\_EVENTS, EKS\_AUDIT\_LOGS, EBS\_MALWARE\_PROTECTION, RDS\_LOGIN\_EVENTS, EKS\_RUNTIME\_MONITORING, LAMBDA\_NETWORK\_LOGS, RUNTIME\_MONITORING, AI\_PROTECTION, AI\_ANALYST. Only one of two features EKS\_RUNTIME\_MONITORING or RUNTIME\_MONITORING can be added, adding both features will cause an error. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |
| <a name="input_status"></a> [status](#input\_status) | (Required) The status of the detector feature. Valid values: ENABLED, DISABLED. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->