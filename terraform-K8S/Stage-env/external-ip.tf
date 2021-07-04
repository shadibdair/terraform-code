# Where we are going to use a data source that will go,
#  to this URL: 
data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
  # AND that will return the IP address of my machine 
}

# And that's IP address I can then use in the security group 
locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}
# SO that I'am 100% sure that I can connect to my cluster.