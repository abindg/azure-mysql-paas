resource "azurerm_mysql_server" "mysql_server" {
  count = var.dbcount_per_server
  name                = "${local.resource_name_prefix}-${var.mysqldb_server_name}-${local.resource_name_suffix}-${count.index}"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name

  administrator_login          = var.mysql_db_username
  administrator_login_password = var.mysql_db_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "8.0"

  auto_grow_enabled                 = false
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false
  #ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "mysqldb" {
  count = var.dbcount_per_server
  name                = "${local.resource_name_prefix}-${var.mysqldb_schema_name}-${local.resource_name_suffix}"
  resource_group_name =  azurerm_resource_group.rsg.name
  server_name         = azurerm_mysql_server.mysql_server[count.index].name 
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "mysql_access_rule" {
  count = var.dbcount_per_server
  depends_on = [azurerm_public_ip.bastionpubip]
  name                = "mysql-firewall-rule-${count.index}"
  resource_group_name = azurerm_resource_group.rsg.name
  server_name         = azurerm_mysql_server.mysql_server[count.index].name 
  start_ip_address    = azurerm_public_ip.bastionpubip.ip_address
  end_ip_address      = azurerm_public_ip.bastionpubip.ip_address
}