provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraformgoat" {
  name     = "huoxian-terraform-goat-resources"
  location = "West Europe"
}

resource "azurerm_public_ip" "terraformgoat" {
  name                = "huoxian-terraform-goat-publicip"
  resource_group_name = azurerm_resource_group.terraformgoat.name
  location            = azurerm_resource_group.terraformgoat.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "terraformgoat" {
  name                = "huoxian-terraform-goat-security-group"
  location            = azurerm_resource_group.terraformgoat.location
  resource_group_name = azurerm_resource_group.terraformgoat.name
  depends_on = [
    azurerm_resource_group.terraformgoat,
  ]

  security_rule {
    name                       = "huoxian-terraform-goat-security-group-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "8080"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "terraformgoat" {
  name                = "huoxian-terraform-goat-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terraformgoat.location
  resource_group_name = azurerm_resource_group.terraformgoat.name
  depends_on = [
    azurerm_resource_group.terraformgoat,
  ]
}

resource "azurerm_subnet" "terraformgoat" {
  name                 = "huoxian-terraform-goat-internal"
  resource_group_name  = azurerm_resource_group.terraformgoat.name
  virtual_network_name = azurerm_virtual_network.terraformgoat.name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [
    azurerm_resource_group.terraformgoat,
    azurerm_virtual_network.terraformgoat
  ]
}

resource "azurerm_network_interface" "terraformgoat" {
  name                = "huoxian-terraform-goat-nic"
  location            = azurerm_resource_group.terraformgoat.location
  resource_group_name = azurerm_resource_group.terraformgoat.name
  depends_on = [
    azurerm_resource_group.terraformgoat,
    azurerm_public_ip.terraformgoat,
    azurerm_subnet.terraformgoat
  ]

  ip_configuration {
    name                          = "huoxian-terraform-goat-internal"
    subnet_id                     = azurerm_subnet.terraformgoat.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraformgoat.id
  }
}

resource "azurerm_linux_virtual_machine" "terraformgoat" {
  name                            = "huoxian-terraform-goat-machine"
  resource_group_name             = azurerm_resource_group.terraformgoat.name
  location                        = azurerm_resource_group.terraformgoat.location
  size                            = "Standard_B1ls"
  admin_username                  = "huoxian"
  admin_password                  = "HuoXian@${random_string.random_suffix.result}"
  disable_password_authentication = false
  user_data                       = "IyEvYmluL2Jhc2gKc3VkbyBhcHQtZ2V0IC15IHVwZGF0ZQpzdWRvIGFwdC1nZXQgLXkgaW5zdGFsbCBhcGFjaGUyCnN1ZG8gYXB0LWdldCAteSBpbnN0YWxsIHBocApzdWRvIGFwdC1nZXQgLXkgaW5zdGFsbCBwaHAtY3VybApzdWRvIHNlZCAtaSAncy9MaXN0ZW4gODAvTGlzdGVuIDgwODAvJyAvZXRjL2FwYWNoZTIvcG9ydHMuY29uZgpzdWRvIC9ldGMvaW5pdC5kL2FwYWNoZTIgcmVzdGFydApjZCAvdmFyL3d3dy9odG1sCnN1ZG8gYXB0LWdldCAteSBpbnN0YWxsIHdnZXQKc3VkbyB3Z2V0IGh0dHBzOi8vaHVvY29ycC1vc3Mub3NzLWNuLWJlaWppbmcuYWxpeXVuY3MuY29tL3RlcnJhZm9ybS1nb2F0LWRlcGVuZGVuY3ktZmlsZXMvY29tbWFuZC1leGVjdXRpb24tbGFiLnppcApzdWRvIGFwdC1nZXQgLXkgaW5zdGFsbCB1bnppcApzdWRvIHVuemlwIGNvbW1hbmQtZXhlY3V0aW9uLWxhYi56aXAKc3VkbyBtdiAuL2NvbW1hbmQtZXhlY3V0aW9uLWxhYi9zdGF0aWMvZmxhZzY5MTUyMjAxLnR4dCAv"
  network_interface_ids = [
    azurerm_network_interface.terraformgoat.id,
  ]
  depends_on = [
    azurerm_resource_group.terraformgoat,
    azurerm_network_interface.terraformgoat
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "random_string" "random_suffix" {
  length  = 6
  special = false
  upper   = false
}