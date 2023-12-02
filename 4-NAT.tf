resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "nat gatewayzzzz"
  }
}

resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "project-1-VPC"
    Service = "애플 일 번"
    Owner = "강아지"
    Planet  = "몰라 알려줘"
  }

  depends_on = [aws_internet_gateway.igw]
}
