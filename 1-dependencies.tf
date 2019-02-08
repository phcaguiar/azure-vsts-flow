data "azurerm_subnet" "subnet" {
  name                 = "${var.shared_subnet_name}"
  virtual_network_name = "${var.shared_vnet_name}"
  resource_group_name  = "${var.network_rg_name}"
}

# resource "azurerm_public_ip" "pubip" {
#   name                         = "phca-publicip"
#   resource_group_name          = "${var.product_rg_name}"
#   location                     = "${var.location}"
#   allocation_method = "Static"
# }