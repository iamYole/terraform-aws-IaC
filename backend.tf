terraform {
  /* backend "s3" {
    bucket         = "ytech-terraform-state"
    key            = "ytech/terraform-cloud/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  } */

  backend "remote" {

    organization = "YoleTechSolutions"
    workspaces {
      name = "terraform-aws-IaC"
    }
  }
}
