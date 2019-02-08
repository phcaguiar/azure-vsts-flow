terraform {
  backend "azurerm" {
    resource_group_name  = "terraformazurestone"
    storage_account_name = "terraformazurestone"
    container_name       = "phcaguiar"
    key                  = "terraform.tfstate"
  }
}