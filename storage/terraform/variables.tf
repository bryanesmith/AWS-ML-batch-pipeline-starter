# Required
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
variable "region"      {}
variable "bucket"      {}

# Optional
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
variable "common_tags"      {
  default = {
    Name = "AWS ML batch pipeline starter"
    Environment = "production"
    ManagedBy = "Terraform"
  }
}
