project_name   = "ASTE"
region         = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
public_subnet = {
  pub-1 = {
    sub_cidr_block = "10.0.0.0/24"
    AZ             = "us-east-1a"
  }
  pub-2 = {
    sub_cidr_block = "10.0.2.0/24"
    AZ             = "us-east-1b"
  }
  pub-3 = {
    sub_cidr_block = "10.0.4.0/24"
    AZ             = "us-east-1c"
  }
}
private_subnet = {
  pri-1 = {
    sub_cidr_block = "10.0.1.0/24"
    AZ             = "us-east-1a"
  }
  pri-2 = {
    sub_cidr_block = "10.0.3.0/24"
    AZ             = "us-east-1b"
  }
  pri-3 = {
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
ami                    = "ami-0778521d914d23bc1"
instance_type          = "t2.micro"
key_name               = "ASHC"
