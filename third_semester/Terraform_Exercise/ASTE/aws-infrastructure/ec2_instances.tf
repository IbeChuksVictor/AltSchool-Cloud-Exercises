resource "aws_instance" "ASTE-webservers" {
  for_each                    = aws_subnet.ASTE-subnets
  subnet_id                   = each.value.id
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ASTE-webserver-sg.id]
  tags = {
    Name = "${var.project_name}-${each.key}-webserver"
  }
}

# Output Variables for Instances
output "ASTE-webservers" {
  value = { for webserver, instance in aws_instance.ASTE-webservers : webserver => instance.public_ip }
}