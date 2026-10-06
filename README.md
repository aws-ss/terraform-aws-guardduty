# terraform-aws-guardduty

A Terraform module that creates an Amazon GuardDuty.

## Available Features

- Delegated Organization Administrator Account
- Organization Auto-Enable Configuration
- Organization Auto-Enable Features
- Invite Member Account
- Accept Member Invitation
- GuardDuty Detector Features
- GuardDuty Detector Enable/Disable
- Set Trust/Threat IP list

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
| [aws_guardduty_detector.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_enable"></a> [enable](#input\_enable) | (Optional) Enable monitoring and feedback reporting. Setting to false is equivalent to 'suspending' GuardDuty. | `bool` | `true` | no |
| <a name="input_finding_publishing_frequency"></a> [finding\_publishing\_frequency](#input\_finding\_publishing\_frequency) | (Optional) Specifies the frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified, otherwise defaults to SIX\_HOURS. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: FIFTEEN\_MINUTES, ONE\_HOUR, SIX\_HOURS. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of resource tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_guardduty_account_id"></a> [guardduty\_account\_id](#output\_guardduty\_account\_id) | The AWS account ID of the GuardDuty detector |
| <a name="output_guardduty_arn"></a> [guardduty\_arn](#output\_guardduty\_arn) | Amazon Resource Name (ARN) of the GuardDuty detector |
| <a name="output_guardduty_id"></a> [guardduty\_id](#output\_guardduty\_id) | The ID of the GuardDuty detector |
| <a name="output_guardduty_tags_all"></a> [guardduty\_tags\_all](#output\_guardduty\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->