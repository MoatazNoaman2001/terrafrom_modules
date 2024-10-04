variable "public_subnets" {
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for the load balancer"
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "instance_ids" {
  description = "List of instance IDs to attach to the LB"
  type        = list(string)
}
