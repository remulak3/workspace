resource "aws_security_group" "workspace-communication" {
  name        = "workspace-communication"
  description = "Allow SSH and HTTP/HTTPS traffic"
  vpc_id      = aws_vpc.workspace.id

  ingress {
    description = "SSH from my ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_address}/32"]
  }
  ingress {
    description = "HTTP from my ip"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_address}/32"]
  }
  ingress {
    description = "HTTP from my ip"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_address}/32"]
  }
  ingress {
    description = "HTTPS from my ip"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_address}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "workspace-communication"
  }
}