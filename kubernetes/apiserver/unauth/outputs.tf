output "apiserver_unauth_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:8443"
  description = "apiserver un-auth lab address link."
}