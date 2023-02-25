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

terraform {
  backend "s3" {
    bucket = "ssk-tf"
    key    = "path/Terrafrom.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "s3" {
  count  = var.numberofS3bukets
  bucket = "${var.Name}-${count.index}"
  
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
    count = var.numberofS3bukets
  bucket = aws_s3_bucket.s3[count.index].bucket

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  rule {
    id = "tmp"

    filter {
      prefix = "tmp/"
    }

    expiration {
      date = "2023-01-13T00:00:00Z"
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count=var.numberofS3bukets
  bucket = aws_s3_bucket.s3[count.index].bucket
  versioning_configuration {
    status = "Enabled"
  }
}

output "outPutFile" {

  value = aws_s3_bucket.s3[*].bucket
}
