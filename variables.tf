variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "List of CIDR for public subnets"
  type = list(string)
}

variable "private_subnet_cidr" {
  description = "List of CIDR for private subnets"
  type = list(string)
}

