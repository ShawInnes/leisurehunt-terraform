data "aws_vpc" "main" {
  id = "${module.vpc.vpc_id}"
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.main.id}"
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.main.id}"

  tags = {
    Environment = "${var.environment}"
    Product     = "${var.product}"
    Tier        = "Public"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.main.id}"

  tags = {
    Environment = "${var.environment}"
    Product     = "${var.product}"
    Tier        = "Private"
  }
}
