resource "aws_iam_policy" "pfsense_dynamic_dns" {
  name        = "pfsense_dynamic_dns"
  description = "Allow pfsense deployed on bedrock network to dynamically point DNS records to itself"

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
