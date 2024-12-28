
# modules/s3-static-website/outputs.tf
output "website_bucket_name" {
  description = "The name of the S3 bucket"
  value = aws_s3_bucket.website.id
}

output "website_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value = aws_s3_bucket.website.arn
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.website.domain_name
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
  
}