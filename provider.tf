#https://registry.terraform.io/browse/providers?tier=official
terraform {
  required_version = ">1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.27.0"
    }
    dock = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = "1.5.3"
    }
  }


}


provider "dock" {
  features {}

}