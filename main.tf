# Configure the OpenStack Provider
provider "openstack" {
  # version          = "~> v1.19.0"
  user_name        = var.username
  domain_name      = var.domain_name
  tenant_name      = var.tenant_name
  user_domain_name = var.user_domain_name != "" ? var.user_domain_name : var.domain_name
  password         = var.password
  auth_url         = var.auth_url
  region           = var.region
}

module "vpc" {
  source  = "./vpc"
  petname = random_pet.pet.id
}

module "instance" {
  instance_name = "ts3"
  source        = "./instance"
  sec_id        = module.vpc.sec_id
  petname       = random_pet.pet.id
}

output "ip" {
  value = module.instance.ip
}

