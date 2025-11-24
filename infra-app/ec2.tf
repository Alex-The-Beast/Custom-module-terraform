resource "aws_key_pair" my_key_new{
    key_name="${var.env}-infra-app-key"
    public_key=file("terraform-local.pub")

    tags ={
        Name = "${var.env}-infra-app-key"
        Environment = var.env
    }
}

resource aws_default_vpc default{
}

resource "aws_security_group" my_security_group {
    name="${var.env}-infra-app-security-group"
    description="My first security group for EC2 instances"
    vpc_id=aws_default_vpc.default.id   #interpolating the default VPC ID from the aws_default_vpc resource 

# inbound rules
    ingress{
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        description="SSH access from anywhere"

    }

    ingress{
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        description="HTTP access from anywhere"

    }

    ingress{
        from_port=443
        to_port=443
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        description="HTTPS access from anywhere"

}
# outbound rules
    egress{
        from_port=0
        to_port=0
        protocol="-1"  # -1 means all protocols
        cidr_blocks=["0.0.0.0/0"]
        description="Allow all outbound traffic"

    }

    tags = {
      Name = "${var.env}-infra-app-security-group"
    }
  
}

resource "aws_instance" my_instance{
    count =var.instance_count  #meta argument do the replica as we write here 

    depends_on = [ aws_security_group.my_security_group,aws_key_pair.my_key_new] # to make sure security group and key pair are created before the instance
    key_name = aws_key_pair.my_key_new.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = var.instance_type  #using each.value to get the value from the map
    ami = var.ec2_ami_id  # specify a valid AMI ID for your region like ubuntu, amazon linux etc.
  

    root_block_device {
      volume_size = var.env == "prd" ? 20:  10 #conditional expression to set volume size based on environment
      volume_type = "gp3"
    }

    tags = {
        Name="${var.env}-infra-app-ec2-instance"  #using each.key to get the key from the map
        Environment=var.env
    }

}