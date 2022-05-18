output "ssrf_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:8080/ssrf-lab"
  description = "ssrf lab address link."
}