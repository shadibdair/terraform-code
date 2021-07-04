# This will just launch an AWS EKS cluster called stage
resource "aws_eks_cluster" "stage" {
  name = var.cluster-name # This cluster name in defined in "vars.tf"
  # EKS cluster needs a role.
  role_arn = aws_iam_role.stage-cluster.arn # So we have that role defined on our "iam.tf" file
  vpc_config{
      security_group_ids = [aws_security_group.stage-cluster.id]
      subnet_ids = module.vpc.public_subnets # Specify in what subnet, EKS cluster needs to be lunched ... That will return the public subnets of the VPC that we created.
  }

  depends_on = [
    aws_iam_role_policy_attachment.stage-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.stage-cluster-AmazonEKSServicePolicy,
  ]
}