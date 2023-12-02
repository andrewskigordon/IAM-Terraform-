resource "aws_launch_template" "app1_LT" {
name_prefix   = "JURKINS"
image_id      = "ami-0230bd60aa48260c6"
instance_type = "t2.micro"

key_name = "seoul-line1-116"

vpc_security_group_ids = [aws_security_group.JURKINS.id]

user_data = base64encode(<<-EOF
  #!/bin/bash
  # Use this for your user data (script from top to bottom)
  # install httpd (Linux 2 version)
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd

  # Get the IMDSv2 token
  TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

  # Background the curl requests
  curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
  curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
  curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
  wait

  macid=$(cat /tmp/macid)
  local_ipv4=$(cat /tmp/local_ipv4)
  az=$(cat /tmp/az)
  vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

  echo "
  <!doctype html>
  <html lang=\"en\" class=\"h-100\">
  <head>
  <title>Details for EC2 instance</title>
  </head>
  <body>
  <div>

  <h1>당신이 짱구 알아?</h1>

  <br>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/xh5Mxet9rCk?si=kFAn1QK1uu7tDDYV" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
  <br>
  <h1>아니면 빵빵이 알아?<h1>
  <br>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/z-FGKPVGv9s?si=sixzXcTh-3VLGU10&amp;start=13" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
  <br>

  p><b>Instance Name:</b> $(hostname -f) </p>
  <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
  <p><b>Availability Zone: </b> $az</p>
  <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
  <br>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/EJbnulJMVnM?si=M4NRjDH7ZBM-s4XM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
  <br>

  </div>
  </body>
  </html>
  " > /var/www/html/index.html

  # Clean up the temp files
  rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
EOF
)

tag_specifications {
  resource_type = "instance"
  tags = {
    Name    = "app1_LT"
    Service = "application1"
    Owner   = "Chewbacca"
    Planet  = "Mustafar"
    }
  }

lifecycle {
  create_before_destroy = true
  }
}




