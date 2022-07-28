# ## efs 생성
# resource "aws_efs_file_system" "team_efs" {
#   creation_token = "team-efs"

#   tags = {
#     Name = "team-efs"
#   }
# }
# ## 탑재대상 was-a
# resource "aws_efs_mount_target" "efs-mount-a" {
#   file_system_id = aws_efs_file_system.team_efs.id
#   subnet_id      = aws_subnet.WAS_a.id
# }
# ## 탑재대상 was-c
# resource "aws_efs_mount_target" "efs-mount-c" {
#   file_system_id = aws_efs_file_system.team_efs.id
#   subnet_id      = aws_subnet.WAS_c.id
# }