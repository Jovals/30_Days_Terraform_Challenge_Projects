### Static Website Hosting with S3 and CloudFront Using Terraform

## Overview
This project sets up an S3 bucket on AWS and uses Cloudfront to serve the website for high availability and low latency.

## Deliverables
- S3 Bucket: 
An infrastructure to store the website content
- Cloudfront Distribution: 
This serves/distriutes the content stored in the S3 bucket globally
- Modules: 
This enables reusabiliy by defining the infrastructure setup (S3 and Cloudfront) in different modules or parts.
- Remote Backend: 
Enables your terraform state file to be stored securely.

## Prerequisites
- Terraform installed on your machine
- AWS account
- CLI configured on your machine with the required permissions

## Project Structure

project-root/
├── modules/
│   └── s3-static-website/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── backend.tf
├── provider.tf
└── variables.tf

## Usage
The codebase comparises of the env and modules folder. The modules folder has the codes that provisions the S3 bucket and Cloudfront Distribution. The env folder is for the environment and in this project we used on the dev environment. 

After going through the codebase, run the following commands in the dev environment folder

1. Initialise Terraform:
To initialise terraform, run the command `terraform init`

2. Validation of the Terraform code:
To check if the terraform configuration is valid, run the command `terraform validate`

3. Check the resources Terraform will provision:
To see the resources terraform will provision before it actually does the provisioning, run the command `terraform plan`

4. Applying the Configuration:
If you are satisfied with the output from the terraform plan, then you can go ahead and apply the configuration by running the command `terraform apply -auto-approve`
![CLI Success image](/30daysTerraform_challenge/Project1/images/CLI_success.PNG)

Checking in the UI to confirm if the resources were actually created:
- For the S3 bucket:
![S3 buket UI image](/30daysTerraform_challenge/Project1/images/S3_buckets_UI.PNG)

- For the Cloudfront:
![Cloudfront UI image](/30daysTerraform_challenge/Project1/images/CLoudfront_UI.PNG)

- For the Static Website:
![Cloudfront website image](/30daysTerraform_challenge/Project1/images/Cloudfront_website.PNG)

## Conclusion
This project demonstrates how to efficiently deploy a scalable and highly available web application on AWS using Terraform. By leveraging EC2 instances in an Auto Scaling Group, an Application Load Balancer (ALB), and modular Terraform configurations, this setup ensures flexibility, resilience, and seamless traffic management.