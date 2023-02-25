resource "aws_iam_group" "iam_group" {
  provider = aws.master_region
  name = "TestGroup"
}

resource "aws_iam_group_policy_attachment" "policy_attachment" {
  provider = aws.master_region
  group      = aws_iam_group.iam_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "iam_user" {
  provider = aws.master_region
  name = "Test"
}

resource "aws_iam_group_membership" "group_user_membership" {
  provider = aws.master_region
  group = aws_iam_group.iam_group.name
  users = [aws_iam_user.iam_user.name]
  name  = "TestMembership"
}