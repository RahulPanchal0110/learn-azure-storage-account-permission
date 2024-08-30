terraform {

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
}
provider "azurerm" {
  features {}
  tenant_id = "0e3e2e88-8caf-41ca-b4da-e3b33b6c52ec"
  client_secret = "4638Q~ROTmiYodN7T9QdLYu3rmZXaO6MWiSMqcLb"
  client_id = "db6fa0f4-2a04-46e0-83b5-b5bcb3ea30de"        
  subscription_id = "9f9b362c-0ced-42f9-8327-987494fd7c26"  
}
resource "azurerm_resource_group" "example123" {
  name     = "example-resources-rahul-sa-permission-check"
  location = "West Europe"
}

resource "azurerm_storage_account" "example123" {
  name                     = "storageaccountname123-permission-check"
  resource_group_name      = azurerm_resource_group.example123.name
  location                 = azurerm_resource_group.example123.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  azure_files_authentication {
      directory_type = "AD"
      default_share_level_permission = StorageFileDataSmbShareReader
  }  


  tags = {
    environment = "staging"
  }
}
