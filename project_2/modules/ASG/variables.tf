# modules/asg/variables.tf
variable "ami_id" {
  description = "AMI ID for the launch template"
  type        = string
}

variable "instance_type" {
  description = "Instance type for ASG"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "User data for ASG instances"
  # type        = string
}

variable "min_size" {
  description = "Minimum size of ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of ASG"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired capacity of ASG"
  type        = number
  default     = 2
}

variable "subnets" {
  description = "Subnets for the ASG"
  type        = list(string)
}