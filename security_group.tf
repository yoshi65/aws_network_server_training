resource "aws_security_group" "WEB-SG" {
  name        = "WEB-SG"
  description = "Created for training"
  vpc_id      = aws_vpc.training.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
