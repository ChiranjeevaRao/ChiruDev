provider "aws" {
  region = var.region # Change to your desired region
}

resource "aws_instance" "my-server" {
  ami                    = var.ami_id
  key_name               = var.key
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my-subnet1.id
  vpc_security_group_ids = [aws_security_group.myvpc-sg.id]
  tags = {
    Name         = "My-Server"
    CreationDate = timestamp()
  }

}

// Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc-cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

}

// Create Subnet 1
resource "aws_subnet" "my-subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet1-cidr
  map_public_ip_on_launch = true # Enable public IP assignment
  availability_zone       = var.subnet1-az
  tags = {
    Name = "my-subnet1"
  }
}

// Create Subnet 2
resource "aws_subnet" "my-subnet2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet2-cidr
  map_public_ip_on_launch = true # Enable public IP assignment
  availability_zone       = var.subnet2-az
  tags = {
    Name = "my-subnet2"
  }
}

// Create Internet gateway
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myigw"
  }
}

// Create Route Table
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "myrt"
  }
}

// Associate Subnet1 with Route Table
resource "aws_route_table_association" "my-art1" {
  subnet_id      = aws_subnet.my-subnet1.id
  route_table_id = aws_route_table.myrt.id
}

// Associate Subnet2 with Route Table
resource "aws_route_table_association" "my-art2" {
  subnet_id      = aws_subnet.my-subnet2.id
  route_table_id = aws_route_table.myrt.id
}

// Create a security group.
resource "aws_security_group" "myvpc-sg" {
  name        = "myvpc-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  tags = {
    Name = "myvpc-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.myvpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.myvpc-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.myvpc-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

module "sgs" {
  source = "./sg_eks"
  vpc_id = aws_vpc.myvpc.id
}

module "eks" {
  source = "./eks"
  sg_ids = module.sgs.security_group_public
  vpc_id = aws_vpc.myvpc.id
  subnet_ids = [aws_subnet.my-subnet1.id,aws_subnet.my-subnet2.id]
    
}
