resource "aws_flow_log" "bedrock" {
  vpc_id          = "${aws_vpc.bedrock.id}"

  traffic_type    = "ALL"
  iam_role_arn    = "${aws_iam_role.bedrock_flow_log.arn}"
  log_destination = "${aws_cloudwatch_log_group.bedrock_flow_log.arn}"
}

resource "aws_cloudwatch_log_group" "bedrock_flow_log" {
  name = "ryanl-vpc-bedrock-flow-log"
}

resource "aws_iam_role" "bedrock_flow_log" {
  name = "ryanl-vpc-bedrock-flow-log-role"

  assume_role_policy = "${data.aws_iam_policy_document.bedrock_flow_log_assume_role.json}"
}

resource "aws_iam_policy" "bedrock_flow_log_role" {
  name = "ryanl-vpc-bedrock-flow-log-role-policy"

  policy = "${data.aws_iam_policy_document.bedrock_flow_log_role.json}"
}

resource "aws_iam_role_policy_attachment" "bedrock_flow_log_role" {
  role       = "${aws_iam_role.bedrock_flow_log.name}"
  policy_arn = "${aws_iam_policy.bedrock_flow_log_role.arn}"
}


// =================== Data =====================
data "aws_iam_policy_document" "bedrock_flow_log_assume_role" {
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

data "aws_iam_policy_document" "bedrock_flow_log_role" {
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
