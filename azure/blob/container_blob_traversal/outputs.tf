output "azurerm_storage_container_url" {
  value       = "https://${azurerm_resource_group.hxexample.name}.blob.core.windows.net/${azurerm_resource_group.hxexample.name}?restype=contriner&comp=list"
  description = "This is the bucket name of azurerm storage container url"
}