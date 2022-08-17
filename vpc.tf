resource "aws_vpc" "workspace" {
  cidr_block       = "10.0.1.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "workspace"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.workspace.id
  cidr_block        = "10.0.1.0/28"
  availability_zone = "${var.aws_region}a"
  tags = {
    Name = "workspace-public"
  }
}
