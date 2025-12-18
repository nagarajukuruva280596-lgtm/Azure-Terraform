terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.56.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
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

resource "random_string" "random_name" {
  length = 16
  upper = false
  
}

resource "azurerm_resource_group" "myrg-1" {
  name = "myrg-1"
  location = "East US 2"
}

resource "azurerm_resource_group" "myrg-2" {
  name = "myrg-2"
  location = "West US"
  provider = azurerm.provider2-westus
}

resource "azurerm_storage_account" "storage-acc" {
  name                     = "mysanaga"
  resource_group_name      = azurerm_resource_group.myrg-1.id
  location                 = azurerm_resource_group.myrg-1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "staging"
  }
}