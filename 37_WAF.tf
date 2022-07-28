# resource "aws_wafv2_web_acl" "team_web_acl" {
#   name  = "team-web-acl"
#   scope = "REGIONAL"

#   default_action {
#     allow {}
#   }

#   rule {
#     name     = "team-rule"
#     priority = 1
#     override_action {
#       count {}
#     }
#     statement {
#       managed_rule_group_statement {
#         name        = "AWSManagedRulesSQLiRuleSet"
#         vendor_name = "AWS"
#       }
#     }
#     visibility_config {
#       cloudwatch_metrics_enabled = false
#       metric_name                = "AWS-AWSManagedRulesSQLiRuleSet"
#       sampled_requests_enabled   = false
#     }
#   }
#   visibility_config {
#     cloudwatch_metrics_enabled = false
#     metric_name                = "friendly-metric-name"
#     sampled_requests_enabled   = false
#   }
# }