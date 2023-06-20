terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}


//variables
variable "instance_type" {
  type = string
}

//locals
locals {
  project_name = "My new proj"
}

resource "aws_instance" "my_server" {
  ami           = "" //get this from aws
  instance_type = var.instance_type   //"t2.micro"

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}

output "instance_ip_address" {
  value = aws_instance.my_server.public_ip
}
