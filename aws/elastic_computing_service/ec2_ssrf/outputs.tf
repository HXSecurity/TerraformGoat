output "ssrf_lab_address_link" {
  value       = "http://${aws_instance.ssrf_web.public_ip}:8080/ssrf-lab"
  description = "ssrf lab address link."
}