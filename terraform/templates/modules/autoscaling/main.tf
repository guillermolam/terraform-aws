## Creating Launch Configuration
resource "aws_launch_configuration" "launch_Config" {
  image_id        = "${var.launchConfig_ami}"
  instance_type   = "${var.launch_config_instance_type}"
  security_groups = ["${var.launch_config_security_group_id}"]
  key_name        = "${var.launch_config_key_name}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

## Creating AutoScaling Group
resource "aws_autoscaling_group" "autoscalingGroup" {
  launch_configuration = "${aws_launch_configuration.launch_Config.id}"
  vpc_zone_identifier   = ["${var.auto_scale_availability_zones}"]
  min_size             = 2
  max_size             = 3

  // load_balancers       = "${var.auto_scale_lb_name}"
  health_check_type = "ELB"

  #tags              = "${merge(var.tags, map("Name", format(var.auto_scaler_name)))}"
}
