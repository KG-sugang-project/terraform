### bastion 보안그룹에서 소스값 관리자 ip
### iam 사용자 ec2 접근 권한 설정

## iam_user
resource "aws_iam_user" "teammate1" {
  name = "teammate1"
}
resource "aws_iam_user" "teammate2" {
  name = "teammate2"
}
resource "aws_iam_user" "teammate3" {
  name = "teammate3"
}
resource "aws_iam_user" "teammate4" {
  name = "teammate4"
}

## iam_group
resource "aws_iam_group" "iam_team_group" {
  name = "iam-team-group"
}

## iam user를 group에 등록
resource "aws_iam_group_membership" "membership" {
  name = aws_iam_group.iam_team_group.name
  users = [
    aws_iam_user.teammate1.name,
    aws_iam_user.teammate2.name,
    aws_iam_user.teammate3.name,
    aws_iam_user.teammate4.name,    
  ]
  group = aws_iam_group.iam_team_group.name
}

## iam group 정책
data "aws_iam_policy" "administrator_access" {
  name = "AdministratorAccess"
}

## iam group 정책을 그룹에 부여
resource "aws_iam_group_policy_attachment" "administrators" {
  group      = aws_iam_group.iam_team_group.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}