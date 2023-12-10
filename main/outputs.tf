output "vpc_id" {
  value = module.vpc.vpc_id
}

output "sn_1" {
  value = module.vpc.sn_1_id

}

output "sn_2" {
  value = module.vpc.sn_2_id

}

output "sn_3" {
  value = module.vpc.sn_3_id

}

output "sn_4" {
  value = module.vpc.sn_4_id

}

output "gw_1" {
  value = module.vpc.gw_1_id
}

output "rt_1" {
  value = module.vpc.rt_1_id
}

output "sg_be" {
  value = module.sg.sg_be_id
}
output "sg_web" {
  value = module.sg.sg_web_id
}
output "sg_db" {
  value = module.sg.sg_db_id
}

output "backend_ec2_public_ip" {
  value = module.ec2_be.ec2_instance_public_ip
}
output "backend_ec2_public_dns" {
  value = module.ec2_be.ec2_instance_public_dns
}
output "backend_ec2_id" {
  value = module.ec2_be.ec2_instance_id
}

output "web_ec2_publc_ip" {
  value = module.ec2_web.ec2_instance_public_ip
}

output "web_ec2_public_dns" {
  value = module.ec2_web.ec2_instance_public_dns
}
output "web_ec2_id" {
  value = module.ec2_web.ec2_instance_id
}
output "db_id" {
  value = module.db.id
}

output "bucket-id" {
  value       = aws_s3_bucket.terraform_state.id
}
output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}
