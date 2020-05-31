provider "aws" {
region = var.region
}

terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "jenkinsterraformbucket1215"
    key    = "terrafom.tfstate"
    dynamodb_table = "jenkinsterraformtable"
  }
}

