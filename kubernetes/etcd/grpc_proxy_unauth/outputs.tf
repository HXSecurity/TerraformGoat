output "etcd_gprc_proxy_unauth_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:23790"
  description = "etcd gprc-proxy un-auth lab address link."
}