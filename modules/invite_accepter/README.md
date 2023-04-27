<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.51.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_invite_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_invite_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) The detector ID of the member GuardDuty account. | `string` | n/a | yes |
| <a name="input_master_account_id"></a> [master\_account\_id](#input\_master\_account\_id) | (Required) AWS account ID for primary account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_guardduty_invite_accepter_id"></a> [aws\_guardduty\_invite\_accepter\_id](#output\_aws\_guardduty\_invite\_accepter\_id) | GuardDuty member detector ID |
<!-- END_TF_DOCS -->