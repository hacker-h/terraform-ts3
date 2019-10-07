variable username {
  type = "string"
}

variable password {
  type = "string"
}

variable domain_name {
  # https://www.terraform.io/docs/providers/openstack/#domain_name
  type = "string"
}

variable user_domain_name {
  # https://www.terraform.io/docs/providers/openstack/#user_domain_name
  type    = "string"
  default = ""
}

variable tenant_name {
  # https://www.terraform.io/docs/providers/openstack/#tenant_name
  type = "string"
}

variable project_id {
  type = "string"
}

variable auth_url {
  type = "string"
}

variable region {
  type    = "string"
  default = "Karlsruhe"
}

# remote state
# see https://www.ibm.com/cloud/blog/store-terraform-states-cloud-object-storage

terraform {
  backend "s3" {
    bucket                      = "113e5b86ad397e6a9bf29b5db2efaf06"
    key                         = "remote_states/ts3-terraform.tfstate"
    region                      = "eu-de"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    endpoint                    = "s3.eu-de.cloud-object-storage.appdomain.cloud"
  }
}
