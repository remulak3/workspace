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

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.workspace.id

  tags = {
    Name = "workspace-internet-gateway"
  }
}

resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.workspace.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}