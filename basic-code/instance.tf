# AWS Instance.....
resource "aws_instance" "my_instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}