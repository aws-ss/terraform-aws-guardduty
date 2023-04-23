output "aws_guardduty_member_id" {
  description = "The ID of the GuardDuty member"
  value       = aws_guardduty_member.this.id
}

output "aws_guardduty_member_relationship_status" {
  description = "The status of the relationship between the member account and its primary account."
  value       = aws_guardduty_member.this.relationship_status
}