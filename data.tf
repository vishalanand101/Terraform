data "azurerm_resource_group" "dazrg" {
  name = "vnet_rg"

}
data "azurerm_key_vault" "azkv" {
  name                = "secretstore111"
  resource_group_name = data.azurerm_resource_group.dazrg.name
  timeouts {
    read = "1m"
  }
  depends_on = [data.azurerm_resource_group.dazrg]


}