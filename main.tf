terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_groups" {
  name     = var.resource_group_name
  location = var.location
}

module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.resource_groups.name
  client_id           = var.client_id
  client_secret       = var.client_secret
  prefix              = var.prefix
  agents_count        = var.agents_count
  agents_size         = var.agents_size

  depends_on = [
      azurerm_resource_group.resource_groups
  ]
}