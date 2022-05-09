output "command_execution_lab_address_link" {
  value       = "http://${azurerm_public_ip.terraformgoat.ip_address}:8080/command-execution-lab"
  description = "command execution lab address link."
}