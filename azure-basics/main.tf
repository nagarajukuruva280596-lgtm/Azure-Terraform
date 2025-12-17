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

resource "azurerm_resource_group" "terraform_rg" {
  location = "East US 2"
  name = "terraform-rg"
}