variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "aws_keypair" {
  description = "keypair used to deploy ec2 instances"
  type        = string
  default     = "developer-default"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    createdBy = "Terraform",
    project   = "Workspace"
  }
}

variable "my_ip_address" {
  description = "My ip address that could be checked on whatsmyip.org"
  type        = string
  default     = "89.79.116.221"
}

