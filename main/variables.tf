variable "aws_region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "project_name" {
  description = "ass-3-peter"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "192.168.0.0/16"
}

variable "subnet_be_cidr" {
  description = "Subnet be CIDR"
  default     = "192.168.1.0/24"
}
variable "subnet_web_cidr" {
  description = "Subnet web CIDR"
  default     = "192.168.2.0/24"
}
variable "subnet_db1_cidr" {
  description = "Subnet db1 CIDR"
  default     = "192.168.3.0/24"
}
variable "subnet_db2_cidr" {
  description = "Subnet db2 CIDR"
  default     = "192.168.4.0/24"
}

variable "default_route"{
  description = "Default route"
  default     = "0.0.0.0/0"
}

variable "home1_net" {
  description = "Home network"
  default     = "174.6.81.63/32"
}
variable "home2_net" {
  description = "Home network"
  default     = "1.2.3.4/32"
}

variable "bcit_net" {
  description = "BCIT network"
  default     = "142.232.0.0/16"
  
}

variable "ami_id" {
  description = "AMI ID"
}

variable "ssh_key_name"{
  description = "AWS SSH key name"
  default = "AWS-assignment1"
}

variable "app_user" {
  default = "backend"
}
variable "app_pass" {
  default = "securepassword"
}

variable "db_user" {
  default = "root"
}
variable "db_pass" {
  default = "password"
}

variable "repository" {
  default = "https://github.com/timoguic/acit4640-py-mysql.git"
}
# export HOST="$(ansible-inventory --playbook-dir "./main" --list | yq ._meta.hostvars.$(ansible-inventory --graph aws_rds | grep terraform | cut -c 6-).endpoint.address)"
# export BACKEND="$(ansible-inventory --playbook-dir "./main" --list  | yq .backend.hosts[0])"
# export WEB="$(ansible-inventory --playbook-dir "./main" --list  | yq .web.hosts[0])"