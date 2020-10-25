# Configure the OpenStack Provider
provider "openstack" {
  version          = "~> v1.25"
  user_name        = var.username
  domain_name      = var.domain_name
  tenant_name      = var.tenant_name
  user_domain_name = var.user_domain_name != "" ? var.user_domain_name : var.domain_name
  password         = var.password
  auth_url         = var.auth_url
  region           = var.region
}

provider "random" {
  version = "~> v2.2"
}

provider "template" {
  version = "~> 2.2.0"
}

module "vpc" {
  source  = "./vpc"
  petname = random_pet.pet.id
}

module "instance" {
  instance_name = "ts3"
  source        = "./instance"
  sec_name        = module.vpc.sec_name
  petname       = random_pet.pet.id
}

output "ip" {
  value = module.instance.ip
}

