module "S3Module" {
    source = "./modules/s3"
    s3_bucket_name = var.Name   
}