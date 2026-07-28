provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

module "sg" {
  source = "../../modules/sg"
  providers = {
    aws.prod = aws.mumbai
  }
}


