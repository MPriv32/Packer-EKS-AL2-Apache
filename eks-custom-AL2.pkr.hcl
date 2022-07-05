locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "AL2-EKS" {

  shared_credentials_file = "~/.aws/credentials"
  profile                  = "GitOps"

  ami_name      = "${var.ami_prefix}-${local.timestamp}"
  instance_type = var.instance_type
  region        = var.region
  source_ami    = "ami-00cf63b12c53803a5"
  ssh_username  = "ec2-user"
  tags          = var.tags
}

build {
  name = "AL2-EKS"
  sources = [
    "source.amazon-ebs.AL2-EKS"
  ]
  provisioner "shell" {
    script = "./script.sh"
  }
}