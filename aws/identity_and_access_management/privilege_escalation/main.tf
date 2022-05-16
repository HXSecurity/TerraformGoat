provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "huoxian_terraform_user" {
  name = "huoxian_terraform_test"
}

resource "aws_iam_access_key" "huoxian_terraform_access_key" {
  user       = aws_iam_user.huoxian_terraform_user.name
  depends_on = [aws_iam_user.huoxian_terraform_user]
}

resource "aws_iam_user_policy" "huoxian_terraform_policy" {
  name       = "IAMFullAccess"
  user       = aws_iam_user.huoxian_terraform_user.name
  depends_on = [aws_iam_user.huoxian_terraform_user]
  policy     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:*",
        "organizations:DescribeAccount",
        "organizations:DescribeOrganization",
        "organizations:DescribeOrganizationalUnit",
        "organizations:DescribePolicy",
        "organizations:ListChildren",
        "organizations:ListParents",
        "organizations:ListPoliciesForTarget",
        "organizations:ListRoots",
        "organizations:ListPolicies",
        "organizations:ListTargetsForPolicy"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

data "template_file" "secret" {
  template = aws_iam_access_key.huoxian_terraform_access_key.encrypted_secret
}