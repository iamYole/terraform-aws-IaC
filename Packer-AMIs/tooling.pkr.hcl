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

 source "amazon-ebs" "tooling-AMI" {
    ami_name      = "YTech-tooling-AMI-${local.timestamp}"
    instance_type = "t2.micro"
    region        = "us-east-1" //var.region

    source_ami_filter {
      filters = {
        name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20240301"
        root-device-type    = "ebs"
        virtualization-type = "hvm"
      }
      most_recent = true
      owners      = ["099720109477"]
    }
    ssh_username = "ubuntu"
    tag {
      key   = "Name"
      value = "tooling-key"
    }
 }

 build {
  sources = ["source.amazon-ebs.tooling-AMI"]

  provisioner "shell" {
    script = "userdata/tooling.sh"
  }
}