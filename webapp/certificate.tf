resource "aws_acm_certificate" "certificate" {
  domain_name               = "${var.domain}"
  validation_method         = "DNS"
  provider                  = "aws.virginia"      # certs must be in this region
  subject_alternative_names = ["*.${var.domain}"]
}

resource "aws_route53_record" "base_zone_acm_validation" {
  zone_id = "${data.aws_route53_zone.base_zone.zone_id}"
  name    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  ttl     = "300"
  records = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
}
