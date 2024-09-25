
# modules/security_group/main.tf
resource "aws_security_group" "jenkins" {
  name   = var.name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value # Same port for individual rules
      protocol    = var.ingress_protocol
      cidr_blocks = var.cidr_blocks # Using the same CIDR for all ports
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      from_port   = egress.value
      to_port     = egress.value # Same port for individual rules
      protocol    = var.egress_protocol
      cidr_blocks = var.cidr_blocks # Using the same CIDR for all ports
    }
  }
}
