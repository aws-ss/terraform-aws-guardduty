resource "aws_guardduty_detector" "this" {
  enable                       = var.enable
  finding_publishing_frequency = var.finding_publishing_frequency

  datasources {
    s3_logs {
      enable = lookup(var.datasources, "s3_logs", false)
    }
    kubernetes {
      audit_logs {
        enable = lookup(var.datasources, "kubernetes_audit_logs", false)
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = lookup(var.datasources, "malware_protection", false)
        }
      }
    }
  }

  tags = var.tags
}