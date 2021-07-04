variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-west-2"
}

# Using map to choose between those zones.
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0ce448b1704085256"
    us-west-2 = "ami-0dd273d94ed0540c0"
    eu-west-1 = "ami-038d7b856fe7557b3"
  }
}
