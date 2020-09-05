variable "aws_region" {
  default = "us-west-2"
}

variable "cluster-name" {
  default = "dev-cluster"
  type    = string
}

variable "workernode-name" {
  default = "standard-workernode"
  type = string
}

# Workstation External IP
#
# This configuration is not required and is
# only provided as an example to easily fetch
# the external IP of your local workstation to
# configure inbound EC2 Security Group access
# to the Kubernetes cluster.
#

data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
}

# Override with variable or hardcoded value if necessary
locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}
