output "cloudfront_distribution_id" {
  description = "The cloudfront distribution ID"
  value       = "${aws_cloudfront_distribution.www_distribution.id}"
}

output "cloudfront_distribution_url" {
  description = "The cloudfront distribution url"
  value       = "${var.domain}"
}
