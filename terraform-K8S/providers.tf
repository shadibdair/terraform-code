provider "aws" {
  # access_key = var.AWS_ACCESS_KEY
  # secret_key = var.AWS_SECRET_KEY
  # region     = var.AWS_REGION
  region = "us-west-2"
  }

# As well as validating a given region name this resource can be used to discover
#  the name of the region configured within the provider
data "aws_region" "current" {}

# The AvailabilityZones data source allows access to the list of AWS Availability Zones
#  which can be accessed by an AWS account within the region configured in the provider.
data "aws_availability_zones" "available" {}

# I used http provider, that can do http queries to get: 
#  - the external IP address for this work station
provider "http" {}