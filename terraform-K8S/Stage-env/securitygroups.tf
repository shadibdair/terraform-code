resource "aws_security_group" "stage-cluster" {
  name        = "terraform-eks-stage-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-eks-stage"
  }
}


# Added here some rules:
# ----------------------
# 1
resource "aws_security_group_rule" "stage-cluster-ingress-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443 # API server runs on 443 
  protocol                 = "tcp"
  security_group_id        = aws_security_group.stage-cluster.id
  source_security_group_id = aws_security_group.stage-node.id
  to_port                  = 443
  type                     = "ingress"
}

#2
resource "aws_security_group_rule" "stage-cluster-ingress-workstation-https" {
  cidr_blocks       = [local.workstation-external-cidr]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443 # Still port 443 
  protocol          = "tcp"
  security_group_id = aws_security_group.stage-cluster.id
  to_port           = 443
  type              = "ingress"
}
# ----------------------