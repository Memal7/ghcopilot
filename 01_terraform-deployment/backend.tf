terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aca-poc"
    storage_account_name = "stgacc9324676"
    container_name       = "terraform-state"
    key                  = "terraform.state"
  }
}