# VPC (4 Subnets)
# CIDR of 192.168.0.0/16
#
# Subnet3 db_1 (Instance)
# CIDR 192.168.3.0/24
# Avail Zone B
#
# Subnet4 db_2
# CIDR 192.168.4.0/24
# Avail Zone A
# 
# Subnet1 be (private, Instance)
# CIDR 192.168.1.0/24
# Avail Zone A
#
# Subnet2 web (public, instance)
# CIDR 192.168.2.0/24
# Avail Zone A
module "vpc" {
  source       = "./mods/terraform_vpc_simple"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  aws_region   = "us-west-1"
}


# Security Groups (db, be, web)

# Security group db
# Ingress 3306 from be
# Egress 3306 to be
module "sg"{
  source = "./mods/terraform_sg_simple"
  project_name = var.project_name
  vpc_id = module.vpc.vpc_id
  depends_on = [module.vpc]
}

# EC2 Instances (2 Instances, 1 public, 1 priv)

# Instance be

module "ec2_be" {
  source = "./mods/terraform_ec2_simple"
  project_name = var.project_name
  aws_region = var.aws_region
  ami_id = var.ami_id
  subnet_id = module.vpc.sn_1_id
  security_group_id = module.sg.sg_be_id
  ssh_key_name = var.ssh_key_name
  server_type = "backend"
}

# Instance web

module "ec2_web" {
  source = "./mods/terraform_ec2_simple"
  project_name = var.project_name
  aws_region = var.aws_region
  ami_id = var.ami_id
  subnet_id = module.vpc.sn_2_id
  security_group_id = module.sg.sg_web_id
  ssh_key_name = var.ssh_key_name
  server_type = "web"
}

# Instance RDS

module "db" {
  source = "./mods/terraform_rds_simple"
  db_1_sn = module.vpc.sn_3_id
  db_2_sn = module.vpc.sn_4_id
  security_group_ids = [module.sg.sg_db_id]
  depends_on = [module.sg]
}



resource "local_file" "tf_backend_config" {
  content = <<EOF
terraform {
    backend "s3" {
        bucket         = "${var.bucket_name}"
        key            = "global/s3/terraform.tfstate"
        dynamodb_table = "${var.dynamodb_name}"
        region         = "${var.region}"
        encrypt        = true
    }
}
EOF

  filename = "./main/backend_config.tf"

}
