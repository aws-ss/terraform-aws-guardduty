output "aws_guardduty_threatintelset_arn" {
  description = "Amazon Resource Name (ARN) of the GuardDuty ThreatIntelSet."
  value       = aws_guardduty_threatintelset.this.arn
}

output "aws_guardduty_threatintelset_id" {
  description = "The ID of the GuardDuty ThreatIntelSet and the detector ID."
  value       = aws_guardduty_threatintelset.this.id
}

output "aws_guardduty_threatintelset_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_guardduty_threatintelset.this.tags_all
}