

data "aws_ami" "latest" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu) owner ID
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_security_group" "web_lb_sg" {
  name = "web-load-balancer-security-group"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  #Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }
}

module "vpc" {
  source        = "../../modules/VPC"
  cidr_block    = var.cidr_block
  azs           = var.azs 
  map_public_ip = true
}

module "ec2" {
  source        = "../../modules/Ec2"
  ami_id        = data.aws_ami.latest.id
  instance_type = var.instance_type
  user_data     = var.user_data
}

module "elb" {
  source          = "../../modules/Elb"
  security_groups = [aws_security_group.web_lb_sg.id]
  subnets         = module.vpc.subnet_ids
  vpc_id          = module.vpc.vpc_id
}

module "asg" {
  source           = "../../modules/ASG"
  ami_id           = data.aws_ami.latest.id
  instance_type    = var.instance_type
  user_data        = var.user_data
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  subnets          = module.vpc.subnet_ids
}