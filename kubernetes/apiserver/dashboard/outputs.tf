output "dashborad_unauth_lab_address_link" {
  value       = "http://${alicloud_instance.instance.public_ip}:8001"
  description = "dashborad un-auth lab address link."
}