module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "jenkins-master"

  ami                    = "ami-0c956e207f9d113d5"
  instance_type          = "t2.micro"
  key_name               = var.aws_keypair
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.workspace-communication.id]
  subnet_id              = aws_subnet.public_subnet.id
  create                 = true
  associate_public_ip_address = true
  user_data = "${file("jenkins-user-data.sh")}"
  tags = var.resource_tags

  depends_on = [
    aws_internet_gateway.gw
  ]
}