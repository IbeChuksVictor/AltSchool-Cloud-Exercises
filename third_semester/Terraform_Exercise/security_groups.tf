# Webserver Security Group
resource "aws_security_group" "ASTE-instances-sg" {
  name        = "${var.project_name}-sg"
  description = "Security group for ${var.project_name} instances"
  vpc_id      = aws_vpc.ASTE-vpc.id

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidr_block
  }
}

# Application Load Balancer Security Group
resource "aws_security_group" "ASTE-lb-sg" {
  name        = "${var.project_name}-lb-sg"
  description = "Security group for ${var.project_name} load balancer"
  vpc_id      = aws_vpc.ASTE-vpc.id

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_cidr_block
  }
}