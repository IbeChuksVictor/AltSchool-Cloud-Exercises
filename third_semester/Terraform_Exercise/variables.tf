variable "region" {}
variable "project_name" {}
variable "vpc_cidr_block" {}
variable "public_subnet" {
  type = map(any)
}
variable "private_subnet" {
  type = map(any)
}
variable "destination_cidr_block" {}
variable "ssh_port" {}
variable "http_port" {}
variable "https_port" {}
variable "ssh_cidr_block" {}
variable "allowed_cidr_block" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}