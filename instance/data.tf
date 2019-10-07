data "openstack_images_image_v2" "ubuntu" {
  properties {
    ssh-user               = "ubuntu"
    docker_version         = "18.09.2"
  }
}

data "template_file" "userdata" {
  template = "${file("${path.module}/templates/userdata.yml")}"

  vars {
    ADMIN_PASSWORD = "${var.ADMIN_PASSWORD}"
  }
}
