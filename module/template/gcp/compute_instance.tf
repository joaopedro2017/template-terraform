module "compute_instance" {
  source         = "../../gcp/compute/compute_instance"
  for_each       = var.compute_instance["create"] ? toset(var.compute_instance["instance_names"]) : []
  instance_name  = each.key
  instance_image = var.compute_instance["instance_image"]
  machine_type   = var.compute_instance["machine_type"]
  location       = var.compute_instance["location"]
}
