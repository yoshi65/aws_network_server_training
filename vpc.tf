resource "aws_vpc" "training" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true

  tags = {
    Name = "training"
  }
}

resource "aws_subnet" "training-public" {
  vpc_id     = aws_vpc.training.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "training-private" {
  vpc_id     = aws_vpc.training.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "training" {
  vpc_id = aws_vpc.training.id

  tags = {
    Name = "training"
  }
}

resource "aws_route_table" "training-public" {
  vpc_id = aws_vpc.training.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.training.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "training-public" {
  subnet_id      = aws_subnet.training-public.id
  route_table_id = aws_route_table.training-public.id
}

resource "aws_route_table" "training-private" {
  vpc_id = aws_vpc.training.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.training.id
  }

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "training-private" {
  subnet_id      = aws_subnet.training-private.id
  route_table_id = aws_route_table.training-private.id
}

resource "aws_eip" "training" {
  vpc = true

  tags = {
    Name = "training"
  }
}

resource "aws_nat_gateway" "training" {
  allocation_id = aws_eip.training.id
  subnet_id     = aws_subnet.training-public.id

  tags = {
    Name = "training"
  }

  depends_on = [aws_internet_gateway.training]
}
