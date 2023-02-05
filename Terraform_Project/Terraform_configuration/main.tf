terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}


resource "local_file" "host_inventory" {
    filename = "/home/vagrant/ansible_tf/host-inventory"
    file_permission = 0777
    content = <<EOT
%{ for ip in aws_instance.web.*.public_ip ~}
server ${ip}
%{ endfor ~}
EOT
}
