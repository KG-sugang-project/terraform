# resource "aws_ami_copy" "AMI_amzn_linux" {
#   name              = "AMI_amzn_linux"
#   description       = "A copy of Amazon Linux 2 AMI - Kernel 4.14 "
#   source_ami_id     = "ami-0e1d09d8b7c751816"
#   source_ami_region = "ap-northeast-2"

#   tags = {
#     Name = "AMI_amzn_linux"
#   }
# }