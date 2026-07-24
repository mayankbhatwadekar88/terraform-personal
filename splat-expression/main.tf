resource "aws_iam_user" "lb" {
  name = "iam-user-${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].id
}
