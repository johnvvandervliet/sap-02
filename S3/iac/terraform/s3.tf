resource "aws_s3_bucket" "my-aws_s3_bucket" {
    tags = {
        Name    = "my bucket"
        Environment = "Dev"
    }
}