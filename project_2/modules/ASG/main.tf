# modules/asg/main.tf
resource "aws_autoscaling_group" "web_asg" {
  launch_template {
    id      = aws_launch_template.web_launch_template.id
    version = "$Latest"
  }
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnets
}

resource "aws_launch_template" "web_launch_template" {
  name          = "web-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = base64encode(var.user_data)
  lifecycle {
    create_before_destroy = true
  }
}