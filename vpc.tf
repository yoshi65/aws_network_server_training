resource "aws_vpc" "training" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "training"
  }
}

resource "aws_subnet" "training" {
  vpc_id     = aws_vpc.training.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_internet_gateway" "training" {
  vpc_id = aws_vpc.training.id

  tags = {
    Name = "training"
  }
}

resource "aws_route_table" "training" {
  vpc_id = aws_vpc.training.id

  tags = {
    Name = "public_route_table"
  }
}
