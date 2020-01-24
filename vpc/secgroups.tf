resource "openstack_networking_secgroup_v2" "my-secgroup" {
  name        = "my-secgroup-${var.petname}"
  description = "Security Group"
}

resource "openstack_networking_secgroup_rule_v2" "terraform-ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "ts3-udp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 9987
  port_range_max    = 9987
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "ts3-tcp1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 10011
  port_range_max    = 10011
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "ts3-tcp3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30033
  port_range_max    = 30033
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my-secgroup.id
}

