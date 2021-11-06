resource "aws_iam_policy" "pfsense_dynamic_dns" {
  # pfsense supports Dynamic DNS on Route 53. It basically just updates the A record whenever the IP
  # changes. Because it interact directly with AWS resources, we need an IAM user with proper
  # permissions.

  name        = "pfsense_dynamic_dns"
  description = "Allow pfsense deployed on bedrock to dynamically point DNS records to itself"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          # Taken from heiber.im/posts/dynamics-dns-with-pfsense-and-route53/
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets"
        ]
        # @notice: we have to give pfsense permission to the entire zone - IAM, or rather Route 53,
        # doesn't support a finer granularity of resource permission, unfortunately.
        Resource = "arn:aws:route53:::hostedzone/${var.route53_bedrock_zone_id}"
      },
    ]
  })
}

resource "aws_iam_user" "pfsense_dynamic_dns" {
  name = "pfsense_dynamic_dns_user"
}

resource "aws_iam_user_policy_attachment" "pfsense_dynamic_dns" {
  user       = aws_iam_user.pfsense_dynamic_dns.name
  policy_arn = aws_iam_policy.pfsense_dynamic_dns.arn
}

resource "aws_iam_access_key" "pfsense_dynamic_dns" {
  user = aws_iam_user.pfsense_dynamic_dns.name
}
