provider "aws" {
  region = "ap-south-1" # Change to your desired region
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "MYTF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "mytfkey"
}

resource "aws_key_pair" "MYTF_key" {
  key_name   = "MYTF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "myVPC"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = "ap-south-1a" # Change to your desired AZ
  map_public_ip_on_launch = true          # Enable public IP assignment

}

# creating internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    name = "my_igw"

  }
}

# creating route table
resource "aws_route_table" "jenkinsrt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    name = "my_routetable"
  }
}

# creating route-table association
resource "aws_route_table_association" "jenkinsrt" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.jenkinsrt.id
}

# creating Security group
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "jenkinsg"
  }
}

# creating instance
resource "aws_instance" "my_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.my_subnet.id
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  user_data                   = file("install_jenkins.sh")
  tags = {
    Name = "Jenkins-Instance"
  }
}
