# Instance in AZ1
resource "aws_instance" "instance_az1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_az1.id
  availability_zone           = var.availability_zone_1
  security_groups             = [aws_security_group.demo_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              enable nginx
              echo "<h1>Homepage!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Instance-AZ1"
  }
}

# Create EC2 Instance in AZ2
resource "aws_instance" "instance_az2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_az2.id
  availability_zone           = var.availability_zone_2
  security_groups             = [aws_security_group.demo_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              mkdir -p /var/www/html/images
              echo "<h1>Images!</h1>" > /var/www/html/images/index.html
              EOF

  tags = {
    Name = "Instance-AZ2"
  }
}

# Create EC2 Instance in AZ3
resource "aws_instance" "instance_az3" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_az3.id
  availability_zone           = var.availability_zone_3
  security_groups             = [aws_security_group.demo_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              mkdir -p /var/www/html/register
              echo "<h1>Register!</h1>" > /var/www/html/register/index.html
              EOF

  tags = {
    Name = "Instance-AZ3"
  }
}
