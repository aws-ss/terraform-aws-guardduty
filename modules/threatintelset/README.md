<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_threatintelset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_threatintelset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate"></a> [activate](#input\_activate) | (Required) Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet. | `bool` | n/a | yes |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) The detector ID of the GuardDuty. | `string` | n/a | yes |
| <a name="input_format"></a> [format](#input\_format) | (Required) The format of the file that contains the ThreatIntelSet. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The URI of the file that contains the ThreatIntelSet. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The friendly name to identify the ThreatIntelSet. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_guardduty_threatintelset_arn"></a> [aws\_guardduty\_threatintelset\_arn](#output\_aws\_guardduty\_threatintelset\_arn) | Amazon Resource Name (ARN) of the GuardDuty ThreatIntelSet. |
| <a name="output_aws_guardduty_threatintelset_id"></a> [aws\_guardduty\_threatintelset\_id](#output\_aws\_guardduty\_threatintelset\_id) | The ID of the GuardDuty ThreatIntelSet and the detector ID. |
| <a name="output_aws_guardduty_threatintelset_tags_all"></a> [aws\_guardduty\_threatintelset\_tags\_all](#output\_aws\_guardduty\_threatintelset\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->