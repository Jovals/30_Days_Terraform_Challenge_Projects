# modules/elb/outputs.tf
output "elb_dns_name" {
  value = aws_lb.web_lb.dns_name
}