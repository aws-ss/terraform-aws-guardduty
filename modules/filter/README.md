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
| [aws_guardduty_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_filter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_action"></a> [action](#input\_action) | (Required) Specifies the action that is to be applied to the findings that match the filter. Valid values: NOOP, ARCHIVE. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the filter. | `string` | `null` | no |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) ID of a GuardDuty detector, attached to your account. | `string` | n/a | yes |
| <a name="input_finding_criteria"></a> [finding\_criteria](#input\_finding\_criteria) | (Required) Criterion blocks that represent the criteria to be used in the filter for querying findings. field is required, and each criterion supports equals, not\_equals, matches, not\_matches (lists of strings) and greater\_than, greater\_than\_or\_equal, less\_than, less\_than\_or\_equal (strings). | <pre>list(object({<br/>    field                 = string<br/>    equals                = optional(list(string))<br/>    not_equals            = optional(list(string))<br/>    greater_than          = optional(string)<br/>    greater_than_or_equal = optional(string)<br/>    less_than             = optional(string)<br/>    less_than_or_equal    = optional(string)<br/>    matches               = optional(list(string))<br/>    not_matches           = optional(list(string))<br/>  }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of your filter. | `string` | n/a | yes |
| <a name="input_rank"></a> [rank](#input\_rank) | (Required) Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings. | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_filter_arn"></a> [filter\_arn](#output\_filter\_arn) | Amazon Resource Name (ARN) of the GuardDuty filter. |
| <a name="output_filter_id"></a> [filter\_id](#output\_filter\_id) | A compound field, consisting of the ID of the GuardDuty detector and the name of the filter. |
| <a name="output_filter_tags_all"></a> [filter\_tags\_all](#output\_filter\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->