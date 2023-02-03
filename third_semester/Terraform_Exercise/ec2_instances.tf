resource "aws_instance" "ASTE-webservers" {
  for_each                    = aws_subnet.ASTE-subnets
  subnet_id                   = each.value.id
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ASTE-webserver-sg.id]

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH connection is ready.'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      host        = self.public_ip
      private_key = file(var.ssh_private_key)
    }
  }

  tags = {
    Name = "${var.project_name}-${each.key}-webserver"
  }
}

resource "local_file" "ASTE-webservers" {
  content  = <<EOT
  [ASTE-webservers]
  ${aws_instance.ASTE-webservers["pub-1"].public_ip}
  ${aws_instance.ASTE-webservers["pub-2"].public_ip}
  ${aws_instance.ASTE-webservers["pub-3"].public_ip}
  EOT
  filename = var.filename
}

resource "null_resource" "ASTE-webservers-configurations" {
  depends_on = [aws_instance.ASTE-webservers]
  provisioner "local-exec" {
    command = "ansible-playbook -i ${local_file.ASTE-webservers.filename} main.yaml"
  }
}
# Output Variables for Instances
output "ASTE-webservers" {
  value = { for webserver, instance in aws_instance.ASTE-webservers : webserver => instance.public_ip }
}
