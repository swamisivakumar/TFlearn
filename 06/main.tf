module "S3Module" {
    source = "./modules/s3"
    s3_bucket_name = var.Name   
}

module "ec2Instance" {
    source = "./modules/ec2"
     instace_type = var.ec2instanceName  
     subnet_id = var.subnet_id
}