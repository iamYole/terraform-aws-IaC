variable "keypair" {
  type = string
}
variable "private_subnets" {
  type = list(any)
}
variable "public_subnets" {
  type = list(any)
}
variable "tags" {
  type = map(any)
}
variable "tag_prefix" {
  type = string
}
variable "bastion_sg-id" {
  type = string
}
variable "nginx_sg-id" {
  type = string
}
variable "webserver_sg-id" {
  type = string
}
variable "image" {
  type = map(any)

  default = {
    "bastion-AMI"   = "ami-0695d4327df64276f"
    "tooling-AMI"   = "ami-0b8a63ab088648f25"
    "nginx-AMI"     = "ami-0468511d9b22bcf44"
    "wordpress-AMI" = "ami-06c65b48303adb1c1"
  }
}
variable "instance_type" {
  type = map(any)

  default = {
    "small"  = "t2.micro"
    "medium" = "t3.medium"
    "large"  = "r5.large"
  }
}
variable "instance_type_value" {
  type = string
}
variable "nginx_tg-arn" {
  type = string
}
variable "wordpress_tg-arn" {
  type = string
}
variable "tooling_tg-arn" {
  type = string
}
