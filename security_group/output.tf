output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "nginx_sg_id" {
  value = aws_security_group.nginx_sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}