output "kubelet_anonymous_auth_lab_address_link" {
  value       = "https://${alicloud_instance.instance.public_ip}:10250"
  description = "kubelet anonymous auth lab address link."
}