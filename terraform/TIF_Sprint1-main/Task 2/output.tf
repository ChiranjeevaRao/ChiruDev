# print the url of the jenkins server

output "website_url" {
  value = join("", ["http://", aws_instance.my_instance.public_dns, ":", "8080"])
}
