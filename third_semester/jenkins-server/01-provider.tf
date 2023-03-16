terraform {
  backend "s3" {
    bucket         = "exam-state-altschool-03"
    key            = "jenkins-server/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Exam_State_Lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
