

variable "project_name" {
    description = "the project that the sg belongs to, used to tag AWS resources" 
    type = string
}

variable "vpc_id" {
    description = "the id of the vpc"
    type = string
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


variable "vpc_cidr" {
  description = "Subnet be CIDR"
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