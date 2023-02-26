output "outPutFile" {
  value = module.S3Module.bucketName
}


output "Ec2InstancePrivateIP" {
   value = module.ec2Instance.privateIP
}
output "Ec2InstanceInstanceID" {
   value = module.ec2Instance.instanceId
}