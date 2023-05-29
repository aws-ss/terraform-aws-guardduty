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
| [aws_guardduty_member.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | (Required) AWS account ID for member account. | `string` | n/a | yes |
| <a name="input_detector_id"></a> [detector\_id](#input\_detector\_id) | (Required) The detector ID of the GuardDuty account where you want to create member accounts. | `string` | n/a | yes |
| <a name="input_disable_email_notification"></a> [disable\_email\_notification](#input\_disable\_email\_notification) | Optional) Boolean whether an email notification is sent to the accounts. | `bool` | `false` | no |
| <a name="input_email"></a> [email](#input\_email) | (Required) Email address for member account. | `string` | n/a | yes |
| <a name="input_invitation_message"></a> [invitation\_message](#input\_invitation\_message) | (Optional) Message for invitation. | `string` | `null` | no |
| <a name="input_invite"></a> [invite](#input\_invite) | (Optional) Boolean whether to invite the account to GuardDuty as a member. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_guardduty_member_id"></a> [aws\_guardduty\_member\_id](#output\_aws\_guardduty\_member\_id) | The ID of the GuardDuty member |
| <a name="output_aws_guardduty_member_relationship_status"></a> [aws\_guardduty\_member\_relationship\_status](#output\_aws\_guardduty\_member\_relationship\_status) | The status of the relationship between the member account and its primary account. |
<!-- END_TF_DOCS -->