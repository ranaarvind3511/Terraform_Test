terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }

  # Configure the backend for Terraform Cloud
  backend "remote" {
    organization = "organization-name"

    workspaces {
      name = "workspace-name"
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
