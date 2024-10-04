# variable "private_subnet_ids" {
#   type        = list(string)
# }

# variable "security_group_ids" {
#   type        = list(string)
# }

variable "ami" {
  type        = string
  default     = "ami-0ebfd941bbafe70c6"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}
