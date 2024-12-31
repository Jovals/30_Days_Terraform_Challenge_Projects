# envs/dev/variables.tf
variable "instance_type" {
  description = "value of the instance type"
  type        = string
}

variable "user_data" {
  default =  <<-EOF
#!/bin/bash
echo "This is kene. I am learning more on terraform. Join me on this journey!" > index.html
nohup busybox httpd -f -p 8080 & 
EOF
}

variable "min_size" {
  description = "minimum size of the autoscaling group"
  type        = number
}

variable "max_size" {
  description = "maximum size of the autoscaling group"
  type        = number
}
variable "server_port" {
  type        = number
  description = "value of the server port"
}
variable "desired_capacity" {
  type        = number
  description = "value of the desired capacity"
}
variable "cidr_blocks" {
  description = "cidr block for the lb"
  default     = ["0.0.0.0/0"]
}
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
