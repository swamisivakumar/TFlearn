
resource "aws_s3_bucket" "s3Bucket" {
  bucket = var.s3_bucket_name
  tags = {
    Name        = "My bukcet"
    Environment = "Dev"
  }

}
