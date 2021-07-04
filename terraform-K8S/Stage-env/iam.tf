# This is the AWS IAM role that uses the EKS service.
resource "aws_iam_role" "stage-cluster" {
  name = "terraform-eks-stage-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}


# Here we make sure that we attach the Amazon EKS cluster policy to it and the Amazon service policy.
# ---------------------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "stage-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.stage-cluster.name
}

resource "aws_iam_role_policy_attachment" "stage-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role = aws_iam_role.stage-cluster.name
}

# If no loadbalancer was ever created in this region, then this following role is necessary
resource "aws_iam_role_policy" "stage-cluster-service-linked-role" {
  name = "service-linked-role"
  role = aws_iam_role.stage-cluster.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAccountAttributes"
            ],
            "Resource": "*"
        }
    ]
}
EOF

}
