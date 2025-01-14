### Scalable Web App with Auto Scaling Group Using Terraform

## Introduction
This project sets up a scalable web application using an Auto Scaling Group (ASG) and Load Balancer, managed through Terraform. The configuration includes:

- Terraform: 
An infrastructure as code tool that allows you to define and provision infrastructure using a high-level configuration language.
- Auto Scaling Group (ASG): 
Automatically adjusts the number of EC2 instances to handle the load.
- Load Balancer: 
Distributes incoming application traffic across multiple targets, such as EC2 instances.

## Prerequisites
- Terraform installed on your machine
- AWS account
- CLI configured on your machine with the required permissions

## Project Structure

scalable-app
|
├── README.md
├── backend.tf
├── envs
│   └── dev
│       ├── main.tf
│       ├── terraform.tfstate
│       ├── terraform.tfstate.backup
│       ├── terraform.tfvars
│       └── variables.tf
├── modules
│   ├── asg
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── ec2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── elb
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── provider.tf

## Usage
The codebase comparises of the env and modules folder. The modules folder has the codes that provisions the VPC, EC2 instances, Autoscaling Group, Elastic Load Balancer. The env folder is for the environment and in this project we used on the dev environment. 

After going through the codebase, run the following commands in the dev environment folder

1. Initialise Terraform:
To initialise terraform, run the command `terraform init`

2. Validation of the Terraform code:
To check if the terraform configuration is valid, run the command `terraform validate`

3. Check the resources Terraform will provision:
To see the resources terraform will provision before it actually does the provisioning, run the command `terraform plan`

4. Applying the Configuration:
If you are satisfied with the output from the terraform plan, then you can go ahead and apply the configuration by running the command `terraform apply -auto-approve`
![CLI Success image](/30daysTerraform_challenge/project_2/images/Project2_CLI.PNG)

Checking in the UI console to see if our resources were successfully provisioned:

- For the VPC
![UI VPC](/30daysTerraform_challenge/project_2/images/Project2_vpc.PNG)

- For the EC2 Instances
![UI E22 instance](/30daysTerraform_challenge/project_2/images/EC2_running.PNG)

- For the ASG
![UI ASG](/30daysTerraform_challenge/project_2/images/ASG_UI.PNG)

- For the ELB 
![UI ELB](/30daysTerraform_challenge/project_2/images/Load_Balancer.PNG)

## Conclusion
This project demonstrates how to efficiently deploy a static website with S3 bucket and render it with cloudfront distribution on AWS using Terraform. The configuration made use of terraform modules for resuability and adopted the DRY concept.