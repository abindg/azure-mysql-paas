resource "azurerm_public_ip" "bastionpubip" {
    name = "${local.resource_name_prefix}-${var.bastionvm_pubipname}"
    resource_group_name = azurerm_resource_group.rsg.name
    location = azurerm_resource_group.rsg.location
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_network_interface" "bastion_vnic" {
  name = "${local.resource_name_prefix}-${var.bastionvm_vnicname}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.bastion_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address = var.bastionvm_privateip
    primary = true
    public_ip_address_id = azurerm_public_ip.bastionpubip.id
  }

}