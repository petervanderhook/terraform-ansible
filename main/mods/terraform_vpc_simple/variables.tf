variable "aws_region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "project_name" {
  description = "Project name"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "192.168.0.0/16"
}

variable "subnet1_cidr" {
  description = "Subnet1 CIDR"
  default     = "192.168.1.0/24"
}
variable "subnet2_cidr" {
  description = "Subnet2 CIDR"
  default     = "192.168.2.0/24"
}
variable "subnet3_cidr" {
  description = "Subnet3 CIDR"
  default     = "192.168.3.0/24"
}
variable "subnet4_cidr" {
  description = "Subnet4 CIDR"
  default     = "192.168.4.0/24"
}

variable "default_route"{
  description = "Default route"
  default     = "0.0.0.0/0"
}

variable "home_net" {
  description = "Home network"
  default     = "0.0.0.0/0"
}

variable "bcit_net" {
  description = "BCIT network"
  default     = "142.232.0.0/16"
  
}
