# configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4"
    }
  }

  required_version = ">= 1.1.0"
}

# configure azurem provider
provider "azurerm" {
  features {}
}

# create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = local.tags
}

# create a Log Analytics workspace for ACA environment
resource "azurerm_log_analytics_workspace" "example" {
  name                = "acctest-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.tags
}

# create a container app environment
resource "azurerm_container_app_environment" "example" {
  name                       = "Example-Environment"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  tags = local.tags
}

# create a container app
resource "azurerm_container_app" "example" {
  name                         = "example-app"
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = "examplecontainerapp"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
}

# create a container registry
resource "azurerm_container_registry" "example" {
  name                = local.container_registry_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  sku                 = var.container_registry_sku
  admin_enabled       = true

  tags = local.tags
}


# create a key vault
resource "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = var.TENANT_ID
  sku_name            = "standard"
}

# create an access policy for the key vault
resource "azurerm_key_vault_access_policy" "example" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = var.TENANT_ID
  object_id    = var.CLIENT_ID

  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Recover",
    "Backup",
    "Restore"
  ]
}