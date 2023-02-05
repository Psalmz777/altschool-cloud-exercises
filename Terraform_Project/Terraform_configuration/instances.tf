resource "aws_instance" "web" {
  ami                = var.ami
  instance_type      = var.instance_type
  availability_zone  = "us-east-1a"
  key_name           = "sam"
  security_groups    = [aws_security_group.allow_web.id] 
  subnet_id          = aws_subnet.subnet1.id
  count = 3 
  tags = {
    Name = "My-Web ${count.index}"
  }
}

