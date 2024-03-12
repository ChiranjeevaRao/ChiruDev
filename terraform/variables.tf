# variable "aws_region" {
 # description = "AWS region"
 # default     = "us-east-1"  # Change to your desired region
#}

# variable "aws_access_key" {
#  description = "AWS access key"
# }

# variable "aws_secret_key" {
 # description = "AWS secret key"
#}

# variable "ami_id" {
 # description = "AMI ID for the EC2 instance"
 # default     = "ami-0f403e3180720dd7e"  # Default Ubuntu 20.04 LTS AMI ID in us-east-1, change accordingly
# }

# variable "instance_type" {
 # description = "Instance type for the EC2 instance"
 # default     = "t2.micro"
#}


variable "aws_region" {}
variable "amis" {}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "public_subnet1_cidr" {}
variable "public_subnet1_name" {}
variable "Main_Routing_Table" {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "environment" { default = "dev" }
variable "instance_type" {}
variable "service_ports" {}