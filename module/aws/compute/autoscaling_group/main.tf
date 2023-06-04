resource "aws_launch_template" "template" {
  name_prefix   = var.name_prefix
  image_id      = var.ami
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "group" {
  vpc_zone_identifier = var.subnet_id
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  tag {
    key                 = "Nome"
    value               = var.name_prefix
    propagate_at_launch = true
  }

}
