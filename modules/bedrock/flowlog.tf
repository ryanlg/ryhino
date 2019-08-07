resource "aws_flow_log" "ryanl_vpc_bedrock_flow_log" {
  vpc_id          = "${aws_vpc.ryanl_vpc_bedrock.id}"

  traffic_type    = "ALL"
  iam_role_arn    = "${aws_iam_role.ryanl_vpc_bedrock_flow_log_role.arn}"
  log_destination = "${aws_cloudwatch_log_group.ryanl_vpc_bedrock_flow_log_group.arn}"
}

resource "aws_cloudwatch_log_group" "ryanl_vpc_bedrock_flow_log_group" {
  name = "ryanl-vpc-bedrock-flow-log"
}

resource "aws_iam_role" "ryanl_vpc_bedrock_flow_log_role" {
  name = "ryanl-vpc-bedrock-flow-log-role"

  assume_role_policy = "${data.aws_iam_policy_document.ryanl_vpc_bedrock_flow_log_assume_role_policy_document.json}"
}

resource "aws_iam_policy" "ryanl_vpc_bedrock_flow_log_role_policy" {
  name = "ryanl-vpc-bedrock-flow-log-role-policy"

  policy = "${data.aws_iam_policy_document.ryanl_vpc_bedrock_flow_log_role_policy_document.json}"
}

resource "aws_iam_role_policy_attachment" "ryanl_vpc_bedrock_flow_log_role_attachment" {
  role       = "${aws_iam_role.ryanl_vpc_bedrock_flow_log_role.name}"
  policy_arn = "${aws_iam_policy.ryanl_vpc_bedrock_flow_log_role_policy.arn}"
}


// =================== Data =====================
data "aws_iam_policy_document" "ryanl_vpc_bedrock_flow_log_assume_role_policy_document" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ryanl_vpc_bedrock_flow_log_role_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = [
      "*"
    ]
  }
}
