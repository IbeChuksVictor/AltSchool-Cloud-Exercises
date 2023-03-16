resource "aws_default_vpc" "default_vpc" {
  
  tags = {
    Name = "default_vpc"
  }
}

#----------------------------------------------------
#                 Avalablility zones
#----------------------------------------------------

data "aws_availability_zones" "available_zones" {}
  
#----------------------------------------------------
#                       subnet
#----------------------------------------------------

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags   = {
    Name = "default subnet"
  }
}

#----------------------------------------------------
#                   Jenkins Server
#----------------------------------------------------

module "jenkins-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~>4.0"

  name                   = "jenkins-ec2-instance"
  ami                    = var.ami
  subnet_id              = aws_default_subnet.default_az1.id
  instance_type          = var.ec2_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_security_group.id]

  tags = {
    Name = "jenkins-server"
  }
}

#----------------------------------------------------
#                    Security Group
#----------------------------------------------------

resource "aws_security_group" "jenkins_security_group" {
  name        = "jenkins-server security group"
  description = "allow access on ports 8080 and 22"
  vpc_id      = aws_default_vpc.default_vpc.id

  # allow access on port 8080
  ingress {
    description = "http proxy access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow access on port 22
  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins server security group"
  }
}

#----------------------------------------------------
#                    Jenkins Server Setup
#----------------------------------------------------

resource "null_resource" "name" {

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = var.jenkins_server_user
    private_key = file("${var.key_path}")
    host        = module.jenkins-instance.public_ip
  }

  # copy the install_jenkins.sh file from your computer to the ec2 instance 
  provisioner "file" {
    source      = var.source_file
    destination = var.destination_file
  }

  # set permissions and run the install_jenkins.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x ${var.destination_file}",
      "sh ${var.destination_file}",
    ]
  }

  # wait for ec2 to be created
  depends_on = [module.jenkins-instance]
}

# print the url of the jenkins server
output "website_url" {
  value = join("", ["http://", module.jenkins-instance.public_dns, ":", "8080"])
}
