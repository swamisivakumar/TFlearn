variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {}
variable "s3_bucket_Name" {}

provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "s3Bucket" {
  bucket = var.s3_bucket_Name
  tags = {
    Name        = "My bukcet"
    Environment = "Dev"
  }

}


output "Mybucket" {
  value = aws_s3_bucket.s3Bucket.bucket

}