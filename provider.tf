terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }

  # Configure the backend for Terraform Cloud
  backend "remote" {
    organization = "vinod0510"

    workspaces {
      name = "Terraform_Test"
    }
  }
}

provider "azurerm" {
  features {}
}
