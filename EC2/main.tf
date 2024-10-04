resource "aws_instance" "nginx_a" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[0]
  security_groups = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

resource "aws_instance" "nginx_b" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[1]
  security_groups = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

