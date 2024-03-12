# with this block it will you can provide the detail which will help to connect to azure if not done interactively
provider "azurerm" {
  features {

  }
  subscription_id = "__subscription_id__"
  client_id       = "__client_id__"
  client_secret   = "__client_secret__"
  tenant_id       = "__tenant_id__"
  environment     = "public"
}

resource "azurerm_resource_group" "azrg" {
  name     = "tfrg"
  location = "centralUS"

}
#ctrl+space
removed {
  from = azurerm_resource_group.azrg1
  lifecycle {
    destroy = false
  }

}
#costom condition check
resource "azurerm_api_management" "azapim" {
  name                = "azureapimstrr"
  resource_group_name = azurerm_resource_group.azrg.name
  location            = azurerm_resource_group.azrg.location

  publisher_email = "user@email.com"
  publisher_name  = "User Name"
  sku_name        = "Developer_1"
  lifecycle {
    precondition {
      condition     = data.azurerm_key_vault.azkv.location != azurerm_resource_group.azrg.location
      error_message = "not found the rg"
    }
    postcondition {
      condition     = data.azurerm_key_vault.azkv.location != azurerm_resource_group.azrg.location
      error_message = "Not able to create"

    }

  }
  timeouts {
    create = "10m"
    delete = "5m"
    update = "7m"
  }
  depends_on = [azurerm_resource_group.azrg, azurerm_resource_group.azrg2]
}
