terraform {
  backend "s3" {
    bucket = "blog-neo-terraform-state"
    key    = "blog-neo"
    region = "ap-northeast-1"
  }
}
