resource "aws_s3_bucket" "remote_s3_module_xmas" {
    bucket = "${var.env}-${var.bucket_name}"

    tags ={
        Name = "${var.env}-${var.bucket_name}"
        Environment = var.env
    }
  
}