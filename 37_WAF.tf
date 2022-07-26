# # resource "aws_wafv2_ip_set" "white_list_ip_list" {
# #   name               = "test-name"
# #   description        = "white ip set"
# #   scope              = "REGIONAL"
# #   ip_address_version = "IPV4"
# #   addresses          = ["127.0.0.1/32"] # 조건에서 제외시킬 ip 추가
# # }

# # resource "aws_wafv2_web_acl" "main" {
# #   name  = "test-acl"
# #   scope = "REGIONAL"

# #   rule {
# #     name     = "test-rule"
# #     priority = 1
# #     action {
# #       block {}
# #     }

# #     statement {
# #       rate_based_statement {
# #         limit              = 1000 # 5분에 1000개의 request가 들어오면 조건에 성립한다.
# #         aggregate_key_type = "IP"
# #         scope_down_statement {
# #           not_statement {
# #             statement { 
# #               ip_set_reference_statement {
# #                 arn = aws_wafv2_ip_set.white_list_ip_list.arn
# #               }
# #             }
# #           }
# #         }
# #       }
# #     }
# #   }
# # }

# resource "aws_wafv2_web_acl" "main" {
#   name  = "test-acl"
#   scope = "REGIONAL"


#   default_action {
#     allow {}
#   }

#   rule {
#     name     = "test-rule"
#     priority = 1
#     action {
#       block {}
#     }


#     statement {

#         managed_rule_group_statement {
#         name        = "AWSManagedRulesSQLiRuleSet"
#         vendor_name = "AWS"
#         }

#         rate_based_statement {
#         limit              = 1000 # 5분에 1000개의 request가 들어오면 조건에 성립한다.
#         aggregate_key_type = "IP"
#       }
#     }

#     visibility_config {
#       cloudwatch_metrics_enabled = false
#       metric_name                = "friendly-rule-metric-name"
#       sampled_requests_enabled   = false
#     }
# }


#   visibility_config {
#     cloudwatch_metrics_enabled = false
#     metric_name                = "friendly-metric-name"
#     sampled_requests_enabled   = false
#   }
# }
  
