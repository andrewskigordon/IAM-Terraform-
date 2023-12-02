resource "aws_security_group" "app1-1521-sg03-DB01" {
  name        = "project-1-DB"
  description = "This is the DB database "
  vpc_id      = aws_vpc.my-first-terraform-VPC.id

ingress {
    description = "DB"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  ingress {
    description = "DB"
    from_port   = 1521
    to_port     = 1521
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-443-sg03-DB01"
    Service = "DB"
    Owner   = "앤드류"
    planet  = "내 꺼를 만들어자마!!!!!!!, 만들어지말라고 했다니까 내 꺼라고"
  }
}

