#https://registry.terraform.io/browse/providers?tier=official
#with this block terraform will install required provider executable 
terraform {
  required_version = ">1.0.0"
  required_providers {
    #here azurerm is local name and it should be unique in the terraform block
    azurerm = {
      source = "hashicorp/azurerm"
      #hostname(optional)/namespace/type
      #ex hostname registry.terraform.io is default name
      version = ">=2.0"
    }
    kubernetes = {
      source = "registry.terraform.io/hashicorp/kubernetes"
      #hostname(optional)/namespace/type
      version = ">=2.27.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = "1.5.3"
    }
  }
  backend "azurerm" {
    storage_account_name = "terraofrmstate"
    resource_group_name  = "app0206rg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    access_key = "***********"

  }


}

# with this block it will you can provide the detail which will help to connect to azure if not done interactively

provider "azurerm" {
  features {

  }
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  environment     = "public"
}

provider "azurerm" {
  features {

  }
  alias           = "lowerversion"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  environment     = "public"




}
