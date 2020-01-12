provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    # Must specify bucket, region via `terraform init` command-line params
    key    = "terraform/storage/terraform.tfstate"
  }
}
