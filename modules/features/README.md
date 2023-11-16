<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_detector_feature.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector_feature) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_configuration"></a> [additional\_configuration](#input\_additional\_configuration) | (Optional) Additional feature configuration block. | `map(string)` | `{}` | no |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) Amazon GuardDuty detector ID. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the detector feature. | `string` | n/a | yes |
| <a name="input_status"></a> [status](#input\_status) | (Required) The status of the detector feature. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->