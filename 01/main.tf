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

resource "aws_instance" "this" {
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t2.micro"
  host_resource_group_arn = "arn:aws:resource-groups:us-west-2:012345678901:group/win-testhost"
  tenancy                 = "host"
}
output "Mybucket" {
  value = aws_s3_bucket.s3Bucket.bucket

}