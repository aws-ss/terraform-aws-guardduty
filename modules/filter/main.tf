resource "aws_guardduty_filter" "this" {
  region      = var.region
  detector_id = var.detector_id
  name        = var.name
  description = var.description
  action      = var.action
  rank        = var.rank
  tags        = var.tags

  finding_criteria {
    dynamic "criterion" {
      for_each = var.finding_criteria
      content {
        field                 = criterion.value.field
        equals                = criterion.value.equals
        not_equals            = criterion.value.not_equals
        greater_than          = criterion.value.greater_than
        greater_than_or_equal = criterion.value.greater_than_or_equal
        less_than             = criterion.value.less_than
        less_than_or_equal    = criterion.value.less_than_or_equal
        matches               = criterion.value.matches
        not_matches           = criterion.value.not_matches
      }
    }
  }
}
