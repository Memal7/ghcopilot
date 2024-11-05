variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
  default     = "rg-poc-aca"
}

variable "location" {
  description = "The Azure region in which to create the Key Vault."
  type        = string
  default     = "Sweden Central"
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "kv-mysecret-01"
}

variable "TENANT_ID" {
  description = "The tenant ID for the Azure account."
  type        = string
}

variable "CLIENT_ID" {
  description = "The client ID for the Azure Service Principal."
  type        = string
}

variable "container_registry_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
  default     = "Basic"
}