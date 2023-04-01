### ECR Role
# arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser

resource "aws_iam_role" "ecr_role" {
 name = var.ecr_iam_role_name

 path = "/"

 assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
        },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF

}

resource "aws_iam_role_policy_attachment" "EcrPolicy" {
 policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
 role    = aws_iam_role.ecr_role.name
}

