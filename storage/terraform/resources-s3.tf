# Bucket used for Terraform state, input data, ETL output, model output
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  acl    = "private"
  tags = var.common_tags
}
