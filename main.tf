# dev infrastrucuture module

module "dev-infra" {
    source = "./infra-app"
    env="dev"
    bucket_name= "infra-app-bucket-xmas"
    instance_count=1
    instance_type="t3.micro"
    ec2_ami_id="ami-0ecb62995f68bb549"
    hash_key="studentID"
}

module "prd-infra" {
    source = "./infra-app"
    env="prd"
    bucket_name= "infra-app-bucket-xmas"
    instance_count=2
    instance_type="t3.micro"
    ec2_ami_id="ami-0ecb62995f68bb549"
    hash_key="studentID"
}

module "stg-infra" {
    source = "./infra-app"
    env="stg"
    bucket_name= "infra-app-bucket-xmas"
    instance_count=1
    instance_type="t3.micro"
    ec2_ami_id="ami-0ecb62995f68bb549"
    hash_key="studentID"
}