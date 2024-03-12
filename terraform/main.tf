# provider "aws" {
 # region     = var.aws_region
 # access_key = var.aws_access_key
 # secret_key = var.aws_secret_key
# }

# resource "aws_instance" "jenkins_instance" {
 # ami           = var.ami_id
 # instance_type = var.instance_type
 # key_name      = aws_key_pair.generated_key.key_name

 # security_groups = [aws_security_group.jenkins_security_group.name]

  # tags = {
  #  Name = "Jenkins_Instance"
 # }
# }

# resource "aws_security_group" "jenkins_security_group" {
 # name        = "jenkins_security_group"
 # description = "Security group for Jenkins"
  
  # ingress {
  #  from_port   = 8080
   # to_port     = 8080
   # protocol    = "tcp"
   # cidr_blocks = ["0.0.0.0/0"]
 # }

  # ingress {
   # from_port   = 22
   # to_port     = 22
   # protocol    = "tcp"
   # cidr_blocks = ["0.0.0.0/0"]
  # }
# }

# resource "aws_key_pair" "generated_key" {
#  key_name   = "jenkins_key"
#  public_key = tls_private_key.jenkins_key.public_key_openssh
# }

# resource "tls_private_key" "jenkins_key" {
#  algorithm = "RSA"
#  rsa_bits  = 2048
# }


#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.vpc_name}"
    Owner       = "Chiranjeevi Konakalla"
    environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.IGW_name}"
  }
}

resource "aws_subnet" "subnet1-public" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}




resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.Main_Routing_Table}"
  }
}

resource "aws_route_table_association" "terraform-public" {
  subnet_id      = aws_subnet.subnet1-public.id
  route_table_id = aws_route_table.terraform-public.id
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id

  #   ingress {
  #     from_port   = 0
  #     to_port     = 0
  #     protocol    = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }

  #   ingress {
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }

  #   ingress {
  #     from_port   = 8080
  #     to_port     = 8080
  #     protocol    = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web-1" {
  ami                         = var.amis
  availability_zone           = "us-east-1a"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name = "Server-1"
  }
}