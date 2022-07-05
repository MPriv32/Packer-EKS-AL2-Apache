variable "ami_prefix" {
  type    = string
  default = "eks-al2"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = map(string)
  default = {
    "Name"        = "EKSImage"
    "Environment" = "Test"
    "OS_Version"  = "Linux"
    "Release"     = "Latest"
    "Created-by"  = "Packer"
  }
}

