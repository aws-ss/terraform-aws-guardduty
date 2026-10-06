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
| [aws_guardduty_organization_admin_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_admin_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_admin_account_id"></a> [admin\_account\_id](#input\_admin\_account\_id) | (Required) AWS account identifier to designate as a delegated administrator for GuardDuty. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_organization_admin_account_id"></a> [organization\_admin\_account\_id](#output\_organization\_admin\_account\_id) | (Required) AWS account identifier to designate as a delegated administrator for GuardDuty. |
| <a name="output_organization_admin_region"></a> [organization\_admin\_region](#output\_organization\_admin\_region) | (Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration. |
<!-- END_TF_DOCS -->