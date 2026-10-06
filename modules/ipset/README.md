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
| [aws_guardduty_ipset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_ipset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_activate"></a> [activate](#input\_activate) | (Required) Specifies whether GuardDuty is to start using the uploaded IPSet. | `bool` | n/a | yes |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) The detector ID of the GuardDuty. | `string` | n/a | yes |
| <a name="input_format"></a> [format](#input\_format) | (Required) The format of the file that contains the IPSet. Valid values: TXT, STIX, OTX\_CSV, ALIEN\_VAULT, PROOF\_POINT, FIRE\_EYE. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The URI of the file that contains the IPSet. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The friendly name to identify the IPSet. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_ipset_arn"></a> [ipset\_arn](#output\_ipset\_arn) | Amazon Resource Name (ARN) of the GuardDuty IPSet. |
| <a name="output_ipset_id"></a> [ipset\_id](#output\_ipset\_id) | The ID of the GuardDuty IPSet. |
| <a name="output_ipset_tags_all"></a> [ipset\_tags\_all](#output\_ipset\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->