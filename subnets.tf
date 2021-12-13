
resource "azurerm_subnet" "bastion_subnet" {
  name = "${local.resource_name_prefix}-${var.bastionsubnetname}"
  resource_group_name = azurerm_resource_group.rsg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = var.bastionsubnetaddress
}