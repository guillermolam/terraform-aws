# File to create an application load balancer
resource "aws_lb" "application" {
  load_balancer_type         = "application"
  name                       = "${var.load_balancer_name}"
  internal                   = "${var.load_balancer_is_internal}"
  security_groups            = ["${var.security_groups}"]
  subnets                    = ["${var.subnets}"]
  idle_timeout               = "${var.idle_timeout}"
  enable_deletion_protection = "${var.enable_deletion_protection}"
  enable_http2               = "${var.enable_http2}"
  ip_address_type            = "${var.ip_address_type}"
  tags                       = "${merge(var.tags, map("Name", var.load_balancer_name))}"

  timeouts {
    create = "${var.load_balancer_create_timeout}"
    delete = "${var.load_balancer_delete_timeout}"
    update = "${var.load_balancer_update_timeout}"
  }
}

#############################################

resource "aws_lb_target_group" "main" {
  name        = "${var.target_group_name}"
  vpc_id      = "${var.vpc_id}"
  port        = "${var.backend_port}"
  protocol    = "${var.backend_protocol}"
  target_type = "${var.target_type}"

  tags = "${merge(var.tags, map("Name", var.target_group_name))}"

  depends_on = ["aws_lb.application"]

  lifecycle {
    create_before_destroy = true
  }
}

#resource "aws_lb_target_group_attachment" "lb" {
#  target_group_arn = "${aws_lb_target_group.main.arn}"

  #target_id = "${var.target_id}"

#  target_id = "${aws_lb_target_group.main.target_id}"
#  port = 80
#}

###########

resource "aws_lb_listener" "frontend_http_tcp" {
  load_balancer_arn = "${aws_lb.application.arn}"
  port              = "${var.http_tcp_listeners_port}"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.main.arn}"
    type             = "forward"
  }
}

# Temporarily defaulting until we get the certificate


#resource "aws_lb_listener" "frontend_https" {
#  load_balancer_arn = "${aws_lb.application.arn}"
#  port              = "${var.https_tcp_listeners_port}"
#  protocol          = "HTTPS"


#certificate_arn   = "${var.certificate_arn}"


#  default_action {
#    target_group_arn = "${aws_lb_target_group.main.arn}"
#    type             = "forward"
#  }
#}

