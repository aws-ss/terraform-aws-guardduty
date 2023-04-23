output "aws_guardduty_organization_admin_account_id" {
  description = "AWS account identifier."
  value       = aws_guardduty_organization_admin_account.this.id
}