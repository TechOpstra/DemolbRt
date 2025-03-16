# Create load balancer

resource "aws_lb" "demo_alb" {
  name               = "demo-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo_sg.id]
  subnets            = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id, aws_subnet.public_subnet_az3.id]

  tags = {
    Name = "demo-alb"
  }
}


# create listener

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.demo_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: Not Found"
      status_code  = "404"
    }
  }
}


# create listener rules

resource "aws_lb_listener_rule" "rule_homepage" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_homepage.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}


resource "aws_lb_listener_rule" "rule_images" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 30

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_images.arn
  }

  condition {
    path_pattern {
      values = ["/images*"]
    }
  }
}

resource "aws_lb_listener_rule" "rule_register" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_register.arn
  }

  condition {
    path_pattern {
      values = ["/register*"]
    }
  }
}




 
# create target groups

resource "aws_lb_target_group" "tg_homepage" {
  name     = "tg-homepage"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "tg-homepage"
  }
}


resource "aws_lb_target_group" "tg_images" {
  name     = "tg-images"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id

  health_check {
    path                = "/images"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "tg-images"
  }
}



resource "aws_lb_target_group" "tg_register" {
  name     = "tg-register"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id

  health_check {
    path                = "/register"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "tg-register"
  }
}


# register target groups with ec2 instances

resource "aws_lb_target_group_attachment" "tg_attachment_homepage" {
  target_group_arn = aws_lb_target_group.tg_homepage.arn
  target_id        = aws_instance.instance_az1.id
  port             = 80
}


resource "aws_lb_target_group_attachment" "tg_attachment_images" {
  target_group_arn = aws_lb_target_group.tg_images.arn
  target_id        = aws_instance.instance_az2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment_register" {
  target_group_arn = aws_lb_target_group.tg_register.arn
  target_id        = aws_instance.instance_az3.id
  port             = 80
}
