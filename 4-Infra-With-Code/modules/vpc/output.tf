output "id" {
  value = aws_vpc.main.id  # Ensure this is the correct reference to your VPC resource
}



output "subnet_ids" {
  value = aws_subnet.sub-1.id  # Reference each subnet directly
}

