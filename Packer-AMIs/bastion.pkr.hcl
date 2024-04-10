# variable "region" {
#   type    = string
#   default = "us-east-1"
# }

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

 source "amazon-ebs" "bastion-AMI" {
    ami_name      = "YTech-bastion-AMI-${local.timestamp}"
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
      value = "bastion-key"
    }
 }

 build {
  sources = ["source.amazon-ebs.bastion-AMI"]

  provisioner "shell" {
    script = "userdata/bastion.sh"
  }
}