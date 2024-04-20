/* variable "region" {
  type    = string
  default = "us-east-1"
} */

/* packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
} */

locals {
    timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  }

 source "amazon-ebs" "wordpress-AMI" {
    ami_name      = "YTech-wordpress-AMI-${local.timestamp}"
    instance_type = "t2.micro"
    region        = "us-east-1" //var.region

    source_ami_filter {
      filters = {
        name                = "RHEL-8.6.0_HVM-20240117-x86_64-2-Hourly2-GP3"
        root-device-type    = "ebs"
        virtualization-type = "hvm"
      }
      most_recent = true
      owners      = ["309956199498"]
    }
    ssh_username = "ec2-user"
    tag {
      key   = "Name"
      value = "wordpress-AMI"
    }
 }

 build {
  sources = ["source.amazon-ebs.wordpress-AMI"]

  provisioner "shell" {
    script = "userdata/wordpress.sh"
  }
}