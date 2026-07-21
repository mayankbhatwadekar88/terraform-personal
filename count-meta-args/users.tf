
resource "aws_iam_user" "users" {
  name = var.usernames[count.index]
  count = 3
}


