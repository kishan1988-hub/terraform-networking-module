output "vpc_id" {
  description = "ID of the VPC"
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "List of public subnet IDs"
  value = values(aws_subnet.public[*]).id
}

output "private_subnet_id" {
  description = "list of private subnet ID"
  value = values(aws_subnet.private)[*].id
}