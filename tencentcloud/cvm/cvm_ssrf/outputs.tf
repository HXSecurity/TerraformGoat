output "ssrf_lab_address_link" {
  value       = "http://${tencentcloud_instance.web.public_ip}:8080/ssrf-lab"
  description = "ssrf lab address link."
}