resource "aws_instance" "ASTE-webservers" {
  for_each                    = aws_subnet.ASTE-subnets
  subnet_id                   = each.value.id
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.ASTE-webserver-sg.name]
  vpc_security_group_ids      = [aws_vpc.ASTE-vpc.id]
  tags = {
    Name = "${var.project_name}-${each.key}"
  }
}