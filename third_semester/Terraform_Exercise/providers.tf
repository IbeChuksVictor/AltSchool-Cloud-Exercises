terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}