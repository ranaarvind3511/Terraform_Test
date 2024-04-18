# Terraform Cloud Deployment on Azure

This README details the steps to configure and deploy Azure resources using Terraform Cloud. Below is a brief overview on how to adjust your `provider.tf` file, configure Azure credentials for authentication, and deploy resources using Terraform Cloud.

## Prerequisites

Before you begin, ensure you have the following:

- An active Azure subscription.
- Access to Terraform Cloud with an account.
- Familiarity with Terraform basics.

## Step 1: Configure Your `provider.tf`

Here's an overview of the `provider.tf` content you provided, with placeholders for sensitive information:

```hcl
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
  client_id       = "xxx"  # Replace with your Azure Client ID
  client_secret   = "xxx"  # Replace with your Azure Client Secret
  subscription_id = "xxx"  # Replace with your Azure Subscription ID
  tenant_id       = "xxx"  # Replace with your Azure Tenant ID
}
```
Adjusting provider.tf
### Organization and Workspace Names:
Replace `organization-name` and `workspace-name` with your actual Terraform Cloud organization and workspace names.
### Azure Credentials:
You will need to replace xxx in the Azure provider block with your actual Azure credentials. This includes `client_id, client_secret, subscription_id, and tenant_id`.

## Step 2: Setting Up Azure Credentials for Authentication
You should not hard-code your credentials in the provider.tf file. Instead, set these as environment variables in Terraform Cloud:

- Log in to Terraform Cloud: <br>
`Go to your workspace.`

- Set Environment Variables: <br>
`Navigate to "Variables" in your workspace settings.`

- Add the following environment variables: <br>
`ARM_CLIENT_ID`: Your Azure Client ID. <br>
`ARM_CLIENT_SECRET`: Your Azure Client Secret (mark as sensitive). <br>
`ARM_SUBSCRIPTION_ID`: Your Azure Subscription ID. <br>
`ARM_TENANT_ID`: Your Azure Tenant ID. <br>

<b> <i> Ensure that ARM_CLIENT_SECRET is marked as sensitive to protect your credentials. </i> </b>

## Terraform Workflow Guide

This section provides a step-by-step guide to using Terraform for deploying infrastructure. It covers the initial setup with `terraform init`, creating a plan with `terraform plan`, and applying that plan with `terraform apply`.

## Getting Started

Ensure that you have Terraform installed on your machine. If not, download and install Terraform from [terraform.io](https://www.terraform.io/downloads.html).

## Terraform Initialization

The first step in using Terraform is to initialize your project. This will prepare your working directory for other commands, set up the backend, and install the provider plugins that Terraform will use.

### Step 1: Initialize Terraform
Run the following command in your terminal:

```bash
terraform init
```
### Step 2: Plan the Execution
Run the following command in your terminal:

```bash
terraform plan
```
### Step 3: Apply the resource deplyment
Run the following command in your terminal:

```bash
terraform apply
```

