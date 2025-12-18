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
    subscription_id = "1349db56-7a42-446d-bce1-63520d61eccf"
}

provider "azurerm" {
  features {
  }
  alias = "provider2-westus"
  subscription_id = "1349db56-7a42-446d-bce1-63520d61eccf"
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