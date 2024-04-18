terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "xxx"
  client_secret   = "xxx"
  subscription_id = "xxx"
  tenant_id       = "xxx"
}
