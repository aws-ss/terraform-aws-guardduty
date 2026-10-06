output "organization_admin_account_id" {
  description = "(Required) AWS account identifier to designate as a delegated administrator for GuardDuty."
  value       = aws_guardduty_organization_admin_account.this.id
}

output "organization_admin_region" {
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  value       = aws_guardduty_organization_admin_account.this.id
}