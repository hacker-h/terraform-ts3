data "openstack_images_image_v2" "ubuntu" {
  properties {
    ssh-user               = "ubuntu"
    docker_version         = "18.09.2"
    docker_compose_version = "1.23.2"
  }
}

data "template_file" "userdata" {
  template = "${file("${path.module}/templates/userdata.yml")}"

  vars {
    ADMIN_PASSWORD = "${var.ADMIN_PASSWORD}"
    SERVERNAME = "${var.SERVERNAME}"
    CPANEL_USERNAME       = "${var.CPANEL_USERNAME}"
    CPANEL_PASSWORD       = "${var.CPANEL_PASSWORD}"
    HOSTNAME = "${var.HOSTNAME}"
  }
}
