resource "aws_s3_bucket" "terraform_state" {
  bucket = "blog-neo-terraform-state"
  acl    = "private"
}
