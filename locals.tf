locals {
  vpc_cidr                            = "172.16.0.0/16"
  enable_dns_support                  = "true"
  enable_dns_hostnames                = "true"
  tag_prefix                          = "${terraform.workspace}_DIO"
  preferred_number_of_public_subnets  = 2
  preferred_number_of_private_subnets = 4
  account_id                          = "023852436886"

  region = {
    "London_Office" = "us-west-2"
    "US_Office"     = "us-east-1"
  }


  instance_type_value = terraform.workspace == "Production" ? "medium" : "small"

  tags = {
    "Environment"     = "${terraform.workspace}" //"Production"
    "Owner-Email"     = "devopsadmin@darey.io"
    "Managed-By"      = "Terraform"
    "Billing-Account" = "1234567890"
  }
}
