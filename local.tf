locals {
  sku_name = "Developer_1"
}
locals {
  postcond = {
    condition = data.azurerm_key_vault.azkv.location != azurerm_resource_group.azrg.location
  error_message = "Not able to create" }

}
