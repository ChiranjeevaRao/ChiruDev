variable "region" {
  default = "ap-south-1"
}

variable "ami_id" {
  default = "ami-03bb6d83c60fc5f7c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key" {
  default = "terra-key"
}

variable "vpc-cidr" {
  default = "10.10.0.0/16"
}

variable "subnet1-cidr" {
  default = "10.10.1.0/24"
}

variable "subnet2-cidr" {
  default = "10.10.2.0/24"
}

variable "subnet1-az" {
  default = "ap-south-1a"
}

variable "subnet2-az" {
  default = "ap-south-1b"
}
