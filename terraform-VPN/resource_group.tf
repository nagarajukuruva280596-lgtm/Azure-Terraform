provider "azurerm" {
  features {
    
  }
  alias = "provider2-resource"
  subscription_id = "1349db56-7a42-446d-bce1-63520d61eccf"
}

resource "azurerm_resource_group" "myrg" {
    location = "West US"
    name = "myrg"
}