resource "aws_security_group" "sg_web" {  
  vpc_id      = var.vpc_id
  tags = {
    name = "sg_web"
    Project = var.project_name
  }
  ingress {
    description = "443 access from all"
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "80 access from all"
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "22 access from home1"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [var.home1_net]
  }
  ingress  {
    description = "22 access from bcit"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [var.bcit_net]
  }
  ingress  {
    description = "allow all ingress from vpc"
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [var.vpc_cidr]
  }
   
  egress  {
      description = "allow all egress traffic"
      protocol = "-1"
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_be" {
  
  vpc_id      = var.vpc_id
  tags = {
    name = "sg_be"
    Project = var.project_name
  }
  ingress  {
      description = "22 access from home1"
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = [var.home1_net]
  }
  ingress  {
      description = "22 access from home2"
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = [var.home2_net]
  }
  ingress  {
      description = "22 access from bcit"
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = [var.bcit_net]
  }
  ingress  {
      description = "all access from vpc"
      protocol = "-1"
      from_port = 0
      to_port = 0
      cidr_blocks = [var.vpc_cidr]
    }
  egress  {
      description = "allow all egress traffic to vpc"
      protocol = "-1"
      from_port = 0
      to_port = 0
      cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "sg_db" {
  vpc_id = var.vpc_id
  tags = {
    name = "sg_db"
    Project = var.project_name
  }
  ingress  {
      description = "3306 ingress from be"
      protocol = "tcp"
      from_port = 3306
      to_port = 3306
      cidr_blocks = [var.subnet_be_cidr]
    }
  egress  {
      description = "allow 3306 to be"
      protocol = "tcp"
      from_port = 3306
      to_port = 3306
      cidr_blocks = [var.subnet_be_cidr]
  }
}
