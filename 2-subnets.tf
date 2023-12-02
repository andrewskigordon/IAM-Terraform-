#public subnets
#us-east-1a
resource "aws_subnet" "public-us-east-1a" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1a"
    Service = "application1"
    Owner = "뚜"
    Planet = "바보"
  }
}

#us-east-1b
resource "aws_subnet" "public-us-east-1b" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1b"
    Service = "application1"
    Owner = "뚜"
    Planet = "바보"
  }
}

#us-east-1c
resource "aws_subnet" "public-us-east-1c" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.3.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1c"
    Service = "application1"
    Owner = "뚜"
    Planet = "바보"
  }
}

#private-subnets
#us-east-1a
resource "aws_subnet" "private-us-east-1a" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.11.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1a"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}

#us-east-1b
resource "aws_subnet" "private-us-east-1b" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.12.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1b"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}

#us-east-1c
resource "aws_subnet" "private-us-east-1c" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.13.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1c"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}

#us-east-1a
resource "aws_subnet" "private-us-east-1a-1" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.21.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1c"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}

#us-east-1b
resource "aws_subnet" "private-us-east-1b-2" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.22.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1c"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}

#us-east-1c
resource "aws_subnet" "private-us-east-1c-3" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id
  cidr_block = "10.87.23.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-us-east-1c"
    Service = "application1"
    Owner = "뚜"
    Planet  = "바보"
  }
}
