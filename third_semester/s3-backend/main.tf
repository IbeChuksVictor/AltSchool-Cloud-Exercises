terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
  backend "s3" {
    bucket = "exam-state-altschool-03"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Exam_State_Lock"
    encrypt = true
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "Exam_State" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name = "Exam_State"
  }
}

resource "aws_dynamodb_table" "Exam_State_Lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Exam_State_Lock"
  }
}