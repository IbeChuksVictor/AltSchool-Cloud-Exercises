variable "bucket_name" {
  default = "exam-state-altschool-03"
}

variable "bucket_key" {
  default = "global/s3/terraform.tfstate"
}

variable "dynamodb_table_name" {
  default = "Exam_State_Lock"
}

variable "region" {
  default = "us-east-1"
}