project_name   = "ASTE"
region         = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
public_subnet = {
  sub-1 = {
    sub_cidr_block = "10.0.0.0/24"
    AZ             = "us-east-1a"
  }
  sub-2 = {
    sub_cidr_block = "10.0.2.0/24"
    AZ             = "us-east-1b"
  }
  sub-3 = {
    sub_cidr_block = "10.0.4.0/24"
    AZ             = "us-east-1c"
  }
}
private_subnet = {
  sub-1 = {
    sub_cidr_block = "10.0.1.0/24"
    AZ             = "us-east-1a"
  }
  sub-2 = {
    sub_cidr_block = "10.0.3.0/24"
    AZ             = "us-east-1b"
  }
  sub-3 = {
    sub_cidr_block = "10.0.6.0/24"
    AZ             = "us-east-1c"
  }
}
destination_cidr_block = "0.0.0.0/0"
ssh_port               = "22"
http_port              = "80"
https_port             = "443"
ssh_cidr_block         = ["197.210.131.42/32"]
allowed_cidr_block     = ["0.0.0.0/0"]

instance_type = "t2.micro"
key_name      = "ASHC"