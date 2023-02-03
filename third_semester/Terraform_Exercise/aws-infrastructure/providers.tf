# Terraform Version 4.0.0 and above
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
    namedotcom = {
      source  = "lexfrei/namedotcom"
      version = "~>1.0"
    }
  }
}

# Provider Configuration
provider "aws" {
  region = var.region
}

provider "namedotcom" {
  username = var.username
  token    = var.token
}

# Output Variables for Region and Project Name
output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}