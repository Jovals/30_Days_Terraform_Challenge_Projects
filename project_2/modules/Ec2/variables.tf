# modules/ec2/variables.tf
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "User data for EC2 instances"
  type        = string
}