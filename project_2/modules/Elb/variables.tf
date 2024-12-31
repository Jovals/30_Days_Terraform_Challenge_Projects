# modules/elb/variables.tf
variable "security_groups" {
  description = "Security groups for the load balancer"
  type        = list(string)
}

variable "subnets" {
  description = "Subnets for the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "server_port" {
  type        = number
  description = "server port for the lb"
  default     = 80

}

variable "cidr_blocks" {
  description = "cidr block for the lb"
  default     = ["0.0.0.0/0"]
}