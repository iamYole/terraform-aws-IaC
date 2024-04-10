/* variable "region" {
  type    = string
  default = "us-east-1"
} */

packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  }

 source "amazon-ebs" "nginx-AMI" {
    ami_name      = "YTech-nginx-AMI-${local.timestamp}"
    instance_type = "t2.micro"
    region        = "us-east-1" //var.region

    source_ami_filter {
      filters = {
        name                = "RHEL-9.3.0_HVM-20240117-x86_64-49-Hourly2-GP3"
        root-device-type    = "ebs"
        virtualization-type = "hvm"
      }
      most_recent = true
      owners      = ["309956199498"]
    }
    ssh_username = "ec2-user"
    tag {
      key   = "Name"
      value = "nginx-key"
    }
 }

 build {
  sources = ["source.amazon-ebs.nginx-AMI"]

  provisioner "shell" {
    script = "userdata/nginx.sh"
  }
}