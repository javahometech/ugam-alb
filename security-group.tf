# create security group for web application

resource "aws_security_group" "web_sg" {
  name        = "ugam_api_web_sg_${terraform.workspace}"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.networking.vpc_id

  dynamic "ingress" {
    for_each = var.web_sg_ingress
    content {
      description = "TLS from VPC"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ugam_api_web_sg"
  }
}