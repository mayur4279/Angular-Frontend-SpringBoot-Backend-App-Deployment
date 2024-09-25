# modules/security_group/variables.tf
variable "ingress_ports" {
  description = "List of ports for ingress rules"
  type        = list(number)
}

variable "egress_ports" {
  description = "List of ports for egress rules"
  type        = list(number)
}


variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}


variable "ingress_protocol" {
  description = "Ingress protocol"
  type        = string
}



variable "egress_protocol" {
  description = "Egress protocol"
  type        = string
}


variable "cidr_blocks" {
  description = "CIDR blocks for ingress and egress rules"
  type        = list(string)
}
