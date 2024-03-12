resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.instance_count
  key_name = var.key-name
  tags = {
     Name = "Ec2Server"
  }
}
