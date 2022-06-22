output "etcd_unauth_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:2379"
  description = "etcd un-auth lab address link."
}