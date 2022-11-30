resource "tencentcloud_instance" "instance" {
  instance_name     = "huocorp_terraform_goat_instance"
  availability_zone = "ap-guangzhou-7"
  image_id          = "img-pi0ii46r"
  security_groups   = [tencentcloud_security_group.default.id]
  instance_type     = data.tencentcloud_instance_types.instance_types.instance_types.0.instance_type
}

resource "tencentcloud_security_group" "default" {
  name        = "huocorp_terraform_goat_security_group"
  description = "make it accessible for both production and stage ports"
  project_id  = 0
}

resource "tencentcloud_security_group_rule" "ingress" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "1-65535"
  policy            = "accept"
  depends_on = [
    tencentcloud_security_group.default
  ]
}

data "tencentcloud_instance_types" "instance_types" {
  filter {
    name   = "instance-family"
    values = ["S6"]
  }
  cpu_core_count = 2
  memory_size    = 2
}