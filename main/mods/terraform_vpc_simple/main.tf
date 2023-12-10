provider "aws" {
  region = var.aws_region
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc_1" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name    = "vpc_1"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn_1" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet1_cidr
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_1"
    Project = var.project_name
  }

}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn_2" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet2_cidr
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_2"
    Project = var.project_name
  }

}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn_3" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet3_cidr
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_3"
    Project = var.project_name
  }

}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn_4" {
  vpc_id                  = aws_vpc.vpc_1.id
  cidr_block              = var.subnet4_cidr
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = true
  tags = {
    Name    = "sn_4"
    Project = var.project_name
  }

}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "gw_1" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name    = "gw_1"
    Project = var.project_name
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "rt_1" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = var.default_route
    gateway_id = aws_internet_gateway.gw_1.id
  }

  tags = {
    Name    = "rt_1"
    Project = var.project_name
  }
}

resource "aws_route_table_association" "web_rt_assoc_1" {
  subnet_id      = aws_subnet.sn_1.id
  route_table_id = aws_route_table.rt_1.id
}

resource "aws_route_table_association" "web_rt_assoc_2" {
  subnet_id      = aws_subnet.sn_2.id
  route_table_id = aws_route_table.rt_1.id
}
