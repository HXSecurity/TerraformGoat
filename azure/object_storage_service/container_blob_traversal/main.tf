provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "hxexample" {
  name     = "hx${random_string.random_suffix.result}"
  location = "West Europe"
}

resource "azurerm_storage_account" "hxexample" {
  name                     = "hx${random_string.random_suffix.result}"
  resource_group_name      = azurerm_resource_group.hxexample.name
  location                 = azurerm_resource_group.hxexample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "hxexample" {
  name                  = "hx${random_string.random_suffix.result}"
  storage_account_name  = azurerm_storage_account.hxexample.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "hxexample" {
  name                   = "flag1650859"
  storage_account_name   = azurerm_storage_account.hxexample.name
  storage_container_name = azurerm_storage_container.hxexample.name
  type                   = "Block"
  source                 = "flag1650859"
}

resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}