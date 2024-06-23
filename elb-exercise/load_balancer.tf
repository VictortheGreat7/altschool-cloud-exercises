resource "aws_elb" "app_lb" {
  name            = "app-lb"
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
  security_groups = [aws_security_group.elb_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  instances = aws_instance.app[*].id

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "app-load-balancer"
  }
}

output "elb_dns_name" {
  value = aws_elb.app_lb.dns_name
}

output "elb_zone_id" {
  value = aws_elb.app_lb.zone_id
}
