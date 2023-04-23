output "aws_guardduty_organization_configuration_id" {
  description = "Identifier of the GuardDuty Detector."
  value       = aws_guardduty_organization_configuration.this.id
}