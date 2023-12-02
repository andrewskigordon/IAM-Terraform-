resource "aws_instance" "JURKINS" {
 ami = "ami-0230bd60aa48260c6"
 instance_type = "t2.micro"
 key_name = "souel-ine3-374"
 vpc_security_group_ids = [aws_security_group.JURKINS.id]
 subnet_id = aws_subnet.public-us-east-1a.id
 
 tags = {
  Name = "<JURKINS-INSTANCE-WITH-THE-UD>"
 }
 user_data = "${file("user_data.sh")}"
}

