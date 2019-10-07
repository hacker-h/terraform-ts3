# Teamspeak3 server with Docker and Terraform on Openstack


## Initialization
Fill in your credentials in terraform.tfvars and backend.tfvars, take a look at the `.example` files.
For more information about how to setup a terraform remote state using IBM object storage look at [this blogpost](https://www.ibm.com/cloud/blog/store-terraform-states-cloud-object-storage).

You can also configure the password for the teamspeak admin user within `terraform.tfvars`,
all other variables can be overwritten within this file as well.

Initialize the project:
```
terraform init --backend-config backend.tf
```

Create all resources:
```
terraform apply --auto-approve
```

Delete all resources:
```
terraform destroy --auto-approve
```

Get the server ip:
```
terraform output ip
```
