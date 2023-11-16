# terraform-aws-guardduty

A Terraform module that creates an Amazon GuardDuty.

## Available Features

- Delegated Organization Administrator Account
- Invite Member Account
- GuardDuty Detector Features
- GuardDuty Detector Enable/Disable
- Set Trust/Threat IP list

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
| [aws_guardduty_detector.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable"></a> [enable](#input\_enable) | (Required) Enable monitoring and feedback reporting. Setting to false is equivalent to 'suspending' GuardDuty. | `string` | n/a | yes |
| <a name="input_finding_publishing_frequency"></a> [finding\_publishing\_frequency](#input\_finding\_publishing\_frequency) | (Optional) Specifies the frequency of notifications sent for subsequent finding occurrences. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of key-value pairs to associate with the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_guardduty_account_id"></a> [aws\_guardduty\_account\_id](#output\_aws\_guardduty\_account\_id) | The AWS account ID of the GuardDuty detector |
| <a name="output_aws_guardduty_arn"></a> [aws\_guardduty\_arn](#output\_aws\_guardduty\_arn) | Amazon Resource Name (ARN) of the GuardDuty detector |
| <a name="output_aws_guardduty_id"></a> [aws\_guardduty\_id](#output\_aws\_guardduty\_id) | The ID of the GuardDuty detector |
| <a name="output_aws_guardduty_tags_all"></a> [aws\_guardduty\_tags\_all](#output\_aws\_guardduty\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END_TF_DOCS -->