# Deployment of EKS Cluster using EC2, Jenkins and Terraform

## Overview
This project demonstrates an end-to-end CI/CD pipeline using AWS services. Jenkins hosted on EC2 Instance, provision of Infrastructure via Terraform and deploy a sample NGINX application using Kubernetes manifests.

## Architecture Diagram
![diagram-export-5-11-2025-10_56_56-PM](https://github.com/user-attachments/assets/84d7b02d-2999-4418-9592-907adfbec2b6)

## Technologies Used

| Category          | Tools Used |
|------------------|------------------|
| **Terraform** | Creating of Ec2 and EKS cluster |
| **Jenkins** | Deployment of EKS cluster |
| **Github** | Repo for Terraform code |
| **Kubernetes** | kubectl |
| **AWS EC2** |  Host Jenkins |

## Getting Started 
### Prerequisites
- AWS account with IAM permission
- Github account
- AWS CLI installed and configured
- SSH key pair for EC2 access
- Terraform installed
- jenkins plugins:

![AwsConfigure](https://github.com/user-attachments/assets/188430e2-922c-4e61-92fd-63e42f1ff9c3)


## Setup Instruction
### 1. Clone the Repository
[Clone Repository](https://github.com/lovish69/jenkins-terraform-k8s/tree/main)
```bash
cd <yourdirectory>
```
![github](https://github.com/user-attachments/assets/2f18940f-2755-44e8-b9d0-0993480be163)

### 2. Terraform Configuration
#### Creation of EC2,VPC and EKS Cluster
```bash
cd terraform/
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
```

![vpc](https://github.com/user-attachments/assets/3aa65bae-b99e-4691-b158-2185ae00041d)


### 3. Creation of S3 bucket for storing tfstate file.

![s3bucket](https://github.com/user-attachments/assets/3a1c4bc8-828d-49c3-888b-e0b183d1011e)

📍We have installed jenkins, terraform and kubectl in EC2 instance using user data script so now we can access it.

### 4. Access Jenkins
- Go to http://<EC2_PUBLIC_IP>:8080
- Unlock Jenkins
- Installed suggested plugins
- Set up admin User

![jenkins](https://github.com/user-attachments/assets/935fcfd3-add0-416d-9e09-f343d1efd260)

### 5. Jenkins Pipeline Setup
- Create a new pipeline Job
- Connect to Github repo
- Provide AWS credentials 
![Credentials](https://github.com/user-attachments/assets/60c2453c-bfe6-49ed-9564-c569a3a12528)

- Use jenkins file with the following stages:
- Checkout SCM
- Terraform init
- Terraform apply
📍 I have provided the jenkinsfile for both EC2 and EKS on github repo.

# EC2 pipeline
![pipelineec2](https://github.com/user-attachments/assets/96465f01-d914-4501-aff3-02df1ef0a404)

# EKS pipeline
![ekspipeline](https://github.com/user-attachments/assets/8eaa3c36-1b69-4410-8ad5-aff6c8c00bc2)

# Deployment
![deployment](https://github.com/user-attachments/assets/71599110-b086-4ad6-885b-e7dd0325895c)

# Troubleshooting
1. While integrating the EKS pipeline and some server credentials error is coming attach this policy to your cluster.
![EKSpolicies](https://github.com/user-attachments/assets/631340c2-93f6-433a-8c4e-01c001b08522)


2. If jenkins not able to start change the version of java











