# This is a data source to get an AMI ID 
data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${aws_eks_cluster.stage.version}-v*"] # We're going to look for the newest EKS worker owned by Amazon
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}
locals {
    # Defined this user data.
  stage-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.stage.endpoint}' --b64-cluster-ca '${aws_eks_cluster.stage.certificate_authority[0].data}' '${var.cluster-name}'
USERDATA

}


# Created this launch configration
#   THIS LAUNCH CONFIGRATION will be used by 
resource "aws_launch_configuration" "stage" {
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.stage-node.name # Used an IAM instance profile.
  image_id = data.aws_ami.eks-worker.id # Used the AMI ID that we just looked up.
  instance_type = "t2.medium" # I've specify our instance type.
  name_prefix = "terraform-eks-stage" # This the name perfix.
  security_groups = [aws_security_group.stage-node.id]
  user_data_base64 = base64encode(local.stage-node-userdata) # user date that is base64 encoded.

  lifecycle {
    create_before_destroy = true
  }
}

# OUR autoscaling group
resource "aws_autoscaling_group" "stage" {
  desired_capacity = 2
  launch_configuration = aws_launch_configuration.stage.id
  max_size = 2
  min_size = 1
  name = "terraform-eks-stage"
  vpc_zone_identifier = module.vpc.public_subnets

  tag {
    key = "Name"
    value = "terraform-eks-stage"
    propagate_at_launch = true
  }

  tag {
    key = "kubernetes.io/cluster/${var.cluster-name}"
    value = "owned"
    propagate_at_launch = true
  }
}
