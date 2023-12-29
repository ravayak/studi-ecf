terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-persistence"
    key     = "terraform-emr-pyspark.tfstate"
    region  = "eu-central-1"

  required_provider "aws" {
    version    = "~> 1.0"
    region     = "${var.region}"
  }
  }
}

provider "aws" {
  region = "${var.region}"
} 
