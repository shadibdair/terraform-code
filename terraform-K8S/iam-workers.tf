# Here we define an AWS IAM role for our node
resource "aws_iam_role" "stage-node" {
  name = "terraform-eks-stage-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

# Here I've attached some policies to it.
resource "aws_iam_role_policy_attachment" "stage-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.stage-node.name
}

resource "aws_iam_role_policy_attachment" "stage-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.stage-node.name
}

resource "aws_iam_role_policy_attachment" "stage-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.stage-node.name
}

resource "aws_iam_instance_profile" "stage-node" {
  name = "terraform-eks-stage"
  role = aws_iam_role.stage-node.name
}
