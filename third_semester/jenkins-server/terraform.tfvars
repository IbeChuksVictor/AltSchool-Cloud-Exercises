#----------------------------------------------------
#               Values of Variables
#----------------------------------------------------

region                     = "us-east-1"
ami                        = "ami-09cd747c78a9add63"
ec2_instance_type          = "t2.micro"
key_name                   = "jenkins-server"
key_path                   = "/home/ibechuks/Downloads/jenkins-server.pem"
jenkins_server_user        = "ec2-user"
source_file                = "./jenkins-server/jenkin-setup.sh"
destination_file           = "/tmp/jenkin-setup.sh"