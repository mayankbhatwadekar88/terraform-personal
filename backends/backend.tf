terraform {
  backend "s3" {
    bucket = "terraform-backend-9498"
    key    = "prod.tfstate"
    region = "us-east-2"
    use_lockfile = true
  }
}

