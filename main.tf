module "vpc" {
  source       = "./vpc"
  network_name = "terra_vpc"
  subnet_name  = "terra_subnet"
  subnet_cidr  = "10.0.1.0/24"
  region       = "us-central1"
}

module "vm_instance" {
  source     = "./vm_instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  image        = "debian-cloud/debian-9"
  network      = module.vpc.vpc_network
  subnetwork   = module.vpc.subnet
}

module "uptime_check_alert_policy" {
  source              = "./uptime_check_alert_policy"
  uptime_check_name   = "terra_uptime_check"
  alert_policy_name   = "terra_alert_policy"
  instance_id         = module.vm_instance.instance_name
  project_id          = "your_project_id"
  notification_channel = "your_notification_channel_id"
}

module "monitoring_dashboard" {
  source         = "./monitoring_dashboard"
  dashboard_name = "terra_dashboard"
  instance_id    = module.vm_instance.instance_name
}
