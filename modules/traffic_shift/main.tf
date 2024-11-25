# by default route53 is pointing to 100% webserver running on datacenter

variable "new_service_ip" {
  type = string
}

variable "weight" {
  type = number
  default = 0
}

variable "old_service_ip" {
  type = string
}

resource "aws_alb" "webserver_alb" {
  name            = "${var.project_name}-alb"
  subnets         = var.subnet_ids
  security_groups = [var.security_group_id]
  
  tags = {
    Name = "${var.project_name}-alb"
  }
}

resource "aws_alb_target_group" "webserver_tg" {
  name     = "${var.project_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
  }
  
  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_alb_listener" "webserver_listener" {
  load_balancer_arn = aws_alb.webserver_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    target_group_arn = aws_alb_target_group.webserver_tg.arn
    type             = "forward"
  }
}

resource "aws_route53_record" "weighted_routing" {
  zone_id = var.route53_zone_id
  name    = var.record_name
  type    = "A"

  weighted_routing_policy {
    weight = var.weight
  }

  set_identifier = "new-service"
  records        = [var.new_service_ip]
}

resource "aws_route53_record" "weighted_routing_old" {
  zone_id = var.route53_zone_id
  name    = var.record_name
  type    = "A"

  weighted_routing_policy {
    weight = 100 - var.weight
  }

  set_identifier = "old-service"
  records        = [var.old_service_ip]
}

