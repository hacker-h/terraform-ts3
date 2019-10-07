# Teamspeak3 server with Docker and Terraform on Openstack


## Initialization
Fill in your credentials in terraform.tfvars and backend.tfvars, take a look at the `.example` files.
For more information about how to setup a terraform remote state using IBM object storage look at [this blogpost](https://www.ibm.com/cloud/blog/store-terraform-states-cloud-object-storage).

You can also configure the password for the teamspeak admin user within `terraform.tfvars`,
all other variables can be overwritten within this file as well.

Create an openstack keypair `my-keypair` with your SSH key.

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

Get the server admin privilege token:
```
ssh -i ~/.ssh/YOUR_KEY ubuntu@$(terraform output ip) sudo docker logs ts3-server
```
You will see an output similar to the following:
```
...
                      I M P O R T A N T
------------------------------------------------------------------
               Server Query Admin Account created
         loginname= "serveradmin", password= "password"
------------------------------------------------------------------


------------------------------------------------------------------
                      I M P O R T A N T
------------------------------------------------------------------
      ServerAdmin privilege key created, please use it to gain
      serveradmin rights for your virtualserver. please
      also check the doc/privilegekey_guide.txt for details.

       token=Xhtly0OsfPbWUt0OuwvbANJrAlky4nKwLgGM2YAw
------------------------------------------------------------------
```
