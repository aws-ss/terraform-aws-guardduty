output "filter_arn" {
  description = "Amazon Resource Name (ARN) of the GuardDuty filter."
  value       = aws_guardduty_filter.this.arn
}

output "filter_id" {
  description = "A compound field, consisting of the ID of the GuardDuty detector and the name of the filter."
  value       = aws_guardduty_filter.this.id
}

output "filter_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_guardduty_filter.this.tags_all
}
