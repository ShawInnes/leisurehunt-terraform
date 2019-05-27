resource "aws_iam_role" "iam_for_lambda" {
  name = "${replace("iam_for_lambda_${var.domain}", ".", "_")}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com",
          "edgelambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "cloudfront_lambda" {
  filename         = "cloudfront_lambda.zip"
  function_name    = "${replace("cloudfront_lambda_${var.domain}", ".", "_")}"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "cloudfront_lambda.handler"
  runtime          = "nodejs8.10"
  source_code_hash = "${base64sha256(file("cloudfront_lambda.zip"))}"
  publish          = "true"
  provider         = "aws.virginia"
}
