output "malware_protection_plan_arn" {
  description = "The ARN of the GuardDuty malware protection plan."
  value       = module.malware_protection_plan.malware_protection_plan_arn
}

output "malware_protection_plan_id" {
  description = "The ID of the GuardDuty malware protection plan."
  value       = module.malware_protection_plan.malware_protection_plan_id
}

output "malware_protection_plan_status" {
  description = "The GuardDuty malware protection plan status."
  value       = module.malware_protection_plan.malware_protection_plan_status
}

output "iam_role_arn" {
  description = "The ARN of the IAM role created for the malware protection plan."
  value       = module.malware_protection_plan.iam_role_arn
}
