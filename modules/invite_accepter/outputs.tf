output "aws_guardduty_invite_accepter_id" {
  description = "GuardDuty member detector ID"
  value       = aws_guardduty_invite_accepter.this.id
}