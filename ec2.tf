data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.training-public.id
  associate_public_ip_address = true
  private_ip                  = "10.0.1.10"
  security_groups             = [aws_security_group.WEB-SG.id]
  key_name                    = aws_key_pair.training.key_name
  user_data                   = file("./user_data_web.sh")

  tags = {
    Name = "web_server"
  }
}

resource "aws_instance" "db" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"

  subnet_id                   = aws_subnet.training-private.id
  associate_public_ip_address = false
  private_ip                  = "10.0.2.10"
  security_groups             = [aws_security_group.DB-SG.id]
  key_name                    = aws_key_pair.training.key_name
  user_data                   = file("./user_data_db.sh")

  tags = {
    Name = "db_server"
  }
}

resource "aws_key_pair" "training" {
  key_name   = "training"
  public_key = file("~/.ssh/training.pub")
}
