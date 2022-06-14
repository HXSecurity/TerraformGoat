output "ssrf_lab_address_link" {
  value       = "http://${huaweicloud_compute_eip_associate.associated.public_ip}:8080/ssrf-lab"
  description = "ssrf lab address link."
}