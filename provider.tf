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
  client_id       = "f72466e4-c2f5-408c-aca6-d8d7fa1f8043"
  client_secret   = "bFx8Q~pKMRcRPaF_mIQAYUYisru1RxAmctssdcQE"
  subscription_id = "1351724e-baf2-4e75-9ca5-4bc7b8d45471"
  tenant_id       = "0e855965-35c9-4f2b-b5e5-cfae8dbb30d5"
}
