resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "tf-networking-vpc"
  }
}

resource "aws_subnet" "public" {
  for_each                = toset(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  tags = {
    Name = "tf-public-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each   = toset(var.private_subnet_cidr)
  vpc_id     = aws_vpc.this.id
  cidr_block = each.value
  tags = {
    Name = "tf-private-${each.key}"
  }

}

resource "aws_security_group" "ssh" {
  name        = "tf-ssh-sg"
  description = "Allows SSH access"
  vpc_id      = aws_vpc.this.id

  ingress  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-ssh-sg"
  }
}

