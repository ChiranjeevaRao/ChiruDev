variable "region"{
     default = "us-east-1"
}

variable "instance_type"{
    default = "t2.micro"
}

variable "instance_count" {
    type = number
    default = 1
}

variable "ami" {
    default = "ami-0f403e3180720dd7e"
}

variable "key-name"{
    default = "terra-key"
}
