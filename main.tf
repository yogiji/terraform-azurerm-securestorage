terraform {
  required_version = ">1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name           = var.resource_group_name
  location                      = var.location
  name                          = var.name
  account_tier                   = "Standard"
  account_replication_type      = var.environment == "Production" ? "GRS" : "LRS"
  public_network_access_enabled = false
  tags                          = local.tags
}
# provider "azurerm" {
#   features {

#   }
#   skip_provider_registration = true
# }

# resource "azurerm_resource_group" "rg" {
#   name = ""
#   location = ""
# }

# module "securestorage" {
#   source  = "app.terraform.io/TerraFormYogi/securestorage/azurerm"
#   version = "1.0.0"
#   resource_group_name = azurerm_resource_group.rg.name
#   location = azurerm_resource_group.rg.location
#   environment = "Production"
#   storage_account_name = "strgacctnm"

# }
