resource "aws_guardduty_organization_configuration" "this" {
  auto_enable = var.auto_enable
  detector_id = var.detector_id

  datasources {
    s3_logs {
      auto_enable = lookup(var.datasources, "s3_logs", false)
    }
    kubernetes {
      audit_logs {
        enable = lookup(var.datasources, "kubernetes_audit_logs", false)
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          auto_enable = lookup(var.datasources, "malware_protection", false)
        }
      }
    }
  }
}