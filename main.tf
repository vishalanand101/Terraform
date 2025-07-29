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

  publisher_email = var.publisher_email
  publisher_name  = var.publisher_name
  sku_name        = local.sku_name
  lifecycle {
    precondition {
      condition     = data.azurerm_key_vault.azkv.location != azurerm_resource_group.azrg.location
      error_message = "not found the rg"
    }
    postcondition {
      condition     = data.azurerm_key_vault.azkv.location != azurerm_resource_group.azrg.location
      error_message = "Not able to create"

    }
    create_before_destroy = false
    ignore_changes = [  ]
    prevent_destroy = false
    replace_triggered_by = [ azurerm_resource_group.azrg, azurerm_resource_group.azrgold ]

  }
  timeouts {
    create = "30m"
    delete = "10m"
    update = "20m"
  }
  depends_on = [azurerm_resource_group.azrg, azurerm_resource_group.azrg2]
  provisioner "local-exec" {
    when       = destroy
    command    = "echo 'destroy time provisioner'"
    on_failure = fail

  }
  provisioner "local-exec" {
    when       = create
    command    = "echo 'create time provisioner'"
    on_failure = continue

  }
}
resource "azurerm_resource_group" "azrgold" {
  name     = "oldversionaliasrg"
  location = azurerm_resource_group.azrg2.location
  provider = azurerm.lowerversion
  provisioner "local-exec" {
    when    = create
    command = "echo 'create time provisioner'"
    on_failure = fail

  }
  provisioner "" {
    
  }

}


module "keyvault" {
  source        = "./Modules/keyvault"
  azrgname      = var.azrgname
  azurelocation = var.azurelocation
  kvname        = var.kvname
  #depends_on    = [module.aks]


}
resource "azurerm_storage_account" "azstrg" {
  count = 4
  account_replication_type = "GRS"
  resource_group_name = var.azrgname
  account_tier = "standard"
  location = var.azurelocation
  name = "server${count.index}strgacc"
}
