provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_resource_group" {
  name     = "cartsters_rg"
  location = "Central US"
}

module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  prefix              = "cartsters"
  agents_count        = 3

  depends_on = [ azurerm_resource_group.aks_resource_group ]
}