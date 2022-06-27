output "kubelet_log-mount_lab_address_link" {
  value       = "https://${alicloud_instance.instance.public_ip}:10250"
  description = "kubelet 'log-mount' lab address link."
}