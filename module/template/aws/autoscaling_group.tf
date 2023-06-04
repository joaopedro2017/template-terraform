module "autoscaling_group" {
  source           = "../../aws/compute/autoscaling_group"
  count            = var.autoscaling_group["create"] ? 1 : 0
  name_prefix      = var.autoscaling_group["group_name"]
  ami              = var.autoscaling_group["ami"]
  instance_type    = var.autoscaling_group["instance_type"]
  desired_capacity = var.autoscaling_group["desired_capacity"]
  max_size         = var.autoscaling_group["max_size"]
  min_size         = var.autoscaling_group["min_size"]
  subnet_id        = [module.subnet_autoscaling_group[0].id]
}
