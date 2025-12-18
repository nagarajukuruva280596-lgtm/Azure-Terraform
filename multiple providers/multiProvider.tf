terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
}

provider "azurerm" {
  features {
  }
  alias = "provider2-westus"
}

resource "azurerm_resource_group" "myrg-1" {
  name = "myrg-1"
  location = "East US 2"
}

resource "azurerm_resource_group" "myrg-2" {
  name = "myrg-2"
  location = "West US 1"
  provider = azurerm.provider2-westus
}