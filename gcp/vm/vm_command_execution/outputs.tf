output "command_execution_lab_address_link" {
  value       = "http://${google_compute_instance.huoxian_terraform_goat_instance.network_interface.0.access_config.0.nat_ip}:8080/command-execution-lab"
  description = "command execution lab address link."
}