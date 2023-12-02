# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "my-first-terraform-VPC" {
  cidr_block = "10.87.0.0/16"

  tags = {
    Name = "project-1-My-VPC"
    Service = "애플 일"
    Owner = "강아지"
    Planet  = "몰라 알려줘"
  }
}
