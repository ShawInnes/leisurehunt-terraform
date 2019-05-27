resource "aws_s3_bucket" "www" {
  bucket = "${var.domain}"
  acl    = "public-read"

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.domain}/*"]
    }
  ]
}
POLICY

  // S3 understands what it means to host a website.
  website {
    index_document = "index.html"
  }
}
