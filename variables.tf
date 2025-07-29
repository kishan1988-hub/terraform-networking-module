variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]+$", var.vpc_cidr))
    error_message = "allowed CIDR must be valid CIDR"
  }
}

variable "public_subnet_cidr" {
  description = "List of CIDR for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

  validation {
    condition     = length(var.public_subnet_cidr) > 0
    error_message = "You must supply atleast one public CIDR"
  }
}

variable "private_subnet_cidr" {
  description = "List of CIDR for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]

  validation {
    condition     = length(var.private_subnet_cidr) > 0
    error_message = "You must supply atleast one private CIDR"
  }
}

