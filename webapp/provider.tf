provider "aws" {
  profile = "shaw"
  region  = "ap-southeast-2"
}

provider "aws" {
  profile = "shaw"
  alias   = "virginia"
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    profile = "shaw"
    bucket  = "leisure-hunt-terraform"
    key     = "webapp/terraform.tfstate"
    region  = "ap-southeast-2"
  }
}
