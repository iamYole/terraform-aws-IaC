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
variable "bastion_ami" {
  type = string
}
variable "nginx_ami" {
  type = string
}
variable "tooling_ami" {
  type = string
}
variable "wordpress_ami" {
  type = string
}
variable "instance_type" {
  type = map(any)

  default = {
    "small"  = "t2.micro"
    "medium" = "t2.meduim"
    "large"  = "t2.large"
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
