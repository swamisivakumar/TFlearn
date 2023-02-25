variable "aws_access_key" {
}
variable "aws_secret_key" {

}
variable "numberofS3bukets" {

}
variable "region" {

}
variable "Name" {

}

provider "aws" {
  region           = var.region
  access_key       = var.aws_access_key
  secret_key       = var.aws_secret_key
}


resource "aws_s3_bucket" "s3" {
  count  = var.numberofS3bukets
  bucket = "${var.Name}-${count.index}"
  
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }

output "outPutFile" {

  value = aws_s3_bucket.s3[*].bucket
}