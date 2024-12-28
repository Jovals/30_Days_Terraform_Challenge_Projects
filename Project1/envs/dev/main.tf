# envs/dev/main.tf
module "static_website" {
  source = "../../modules/s3-static-website"

  bucket_name = var.bucket_name
  environment = var.environment

}