Terraform Multi-Environment Architecture

📌 Overview

This architecture represents a Terraform-based multi-environment setup, where a user triggers Terraform (Tf) to deploy resources into:

dev

stage

prd (production)

Each environment has different compute sizes and independent AWS resources such as EC2, S3, and DynamoDB.

🧑‍💻 User

The user interacts with Terraform through commands:

terraform init

terraform plan

terraform apply

Terraform then provisions or updates infrastructure in the selected environment.

⚙️ Terraform (Tf)

Terraform performs:

Reading configuration (.tf files)

Managing the state (terraform.tfstate)

Using AWS providers

Applying different configs via workspaces or .tfvars files

Ensuring consistent deployments across environments

🌱 Environments
1. Dev Environment

Resources include:

t2.micro EC2 instance

S3 bucket

DynamoDB table

Used for testing and development.

2. Stage Environment

Resources include:

t2.small EC2 instance

S3 bucket

DynamoDB table

This environment is used for QA, validation, and pre-production checks.

3. Production (prd) Environment

Resources include:

Two t2.medium EC2 instances

S3 bucket

DynamoDB table

This is the actual customer-facing environment with higher capacity.

🚀 How Terraform Chooses the Environment
Option 1 — Workspaces
terraform workspace new dev
terraform workspace new stage
terraform workspace new prd
terraform apply

Option 2 — Variable Files
terraform apply -var-file="dev.tfvars"
terraform apply -var-file="stage.tfvars"
terraform apply -var-file="prd.tfvars"

Option 3 — Separate Modules per Environment

Each environment folder contains its own variable overrides and module references.

✅ Summary

This Terraform setup ensures:

Clean separation of environments

Scalable infrastructure (different instance sizes)

Easy updates using IaC

Safe deployments with Terraform plan & state management

Production-grade workflow using S3 + DynamoDB