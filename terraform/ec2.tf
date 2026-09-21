resource "aws_instance" "app" {
  ami           = "ami-0abcdef1234567891"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  tags = {
    Name = "two-tier-app"
  }
}