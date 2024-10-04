resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = var.security_group_ids
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}