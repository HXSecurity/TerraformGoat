output "kubelet_read_only_port_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:10255"
  description = "kubelet 'read only port' lab address link."
}