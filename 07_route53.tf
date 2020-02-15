#####################################
# Route53 Settings
#####################################
# resource "aws_route53_zone" "this" {
#   name = "blog-neo.com"
# }

resource "aws_route53_record" "this" {
  zone_id = "Z3PU4A00PSX9MK"
  name    = "blog-neo.com"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.this.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.this.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "acm" {
  count   = "${length(aws_acm_certificate.cloudfront.domain_validation_options)}"
  zone_id = "Z3PU4A00PSX9MK"
  name    = "${lookup(aws_acm_certificate.cloudfront.domain_validation_options[count.index],"resource_record_name")}"
  type    = "${lookup(aws_acm_certificate.cloudfront.domain_validation_options[count.index],"resource_record_type")}"
  ttl     = "300"
  records = ["${lookup(aws_acm_certificate.cloudfront.domain_validation_options[count.index],"resource_record_value")}"]
}
