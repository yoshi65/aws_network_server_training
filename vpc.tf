resource "aws_vpc" "training" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "training"
  }
}
