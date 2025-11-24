variable "env" {
    description = "This is my environment for my app."
    type = string
}

variable "bucket_name" {
    description = "This is my S3 bucket name."
    type = string
  
}

variable "instance_count" {
    description = "Number of EC2 instances to launch."
    type = number
  
}

variable "instance_type" {
    description = "Type of instance you want to create"
    type = string
  
}

variable "ec2_ami_id" {
    description = "AMI ID for the EC2 instance."
    type = string
  
}

variable "hash_key" {
    description = "Hash key for DynamoDB table."
    type = string
  
}