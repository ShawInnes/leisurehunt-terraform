data "aws_route53_zone" "base_zone" {
  name = "${var.domain}"
}

resource "aws_route53_record" "base_zone_wildcard" {
  zone_id = "${data.aws_route53_zone.base_zone.zone_id}"
  name    = "*.${data.aws_route53_zone.base_zone.name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.www_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "base_zone_apex" {
  zone_id = "${data.aws_route53_zone.base_zone.zone_id}"
  name    = "${data.aws_route53_zone.base_zone.name}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.www_distribution.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.www_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}
