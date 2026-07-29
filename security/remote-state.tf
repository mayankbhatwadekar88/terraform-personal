data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "terraform-backend-9498"
    key    = "prod.tfstate"
    region = "us-east-2"
  }
}

