output "scenario_links" {
  value       = "http://${aws_instance.huoxian_terraform_goat_instance.public_ip}:8080/ssrf-lab"
  description = "This is the link to the AWS console takeover scenario."
}