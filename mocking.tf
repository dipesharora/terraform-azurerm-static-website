resource "azurerm_virtual_network" "test_mocking_demo" {
  name                = "test-mocking-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    Name = "mockingbird"
  }
}

resource "azurerm_subnet" "test_mocking_demo" {
  name                 = "test-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.test_mocking_demo.name
  address_prefixes     = ["10.0.2.0/24"]
}