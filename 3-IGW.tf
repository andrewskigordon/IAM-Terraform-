resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-first-terraform-VPC.id

  tags = {
    Name = "project-1-VPC"
    Service = "애플 일"
    Owner = "강아지"
    Planet  = "몰라 알려줘"
  }
}
