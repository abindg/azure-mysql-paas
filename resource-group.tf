# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rsg" {
  name = "${local.resource_name_prefix}-${var.resourcegroupname}-${local.resource_name_suffix}"
  location = var.resourcegrouplocation
}