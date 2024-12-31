variable "cidr_block" {
  description = "CIDR block for the VPC"
  
}

variable "azs" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "map_public_ip" {
  description = "Whether to enable public IP assignment"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "AWS region for the resources"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  default     = "my-vpc-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "CIDR block for subnet A"
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  description = "CIDR block for subnet B"
  default     = "10.0.2.0/24"
}

