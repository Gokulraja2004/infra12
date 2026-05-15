terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
  backend "s3"{
    bucket = "gokul22026"
    key = "environments/dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terra"
  
}
}

provider "aws" {
  region = "ap-south-1"
}
