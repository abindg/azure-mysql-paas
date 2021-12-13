locals {
  client = var.client
  environment = var.environment
  resource_name_prefix = "we-${var.client}"
  resource_name_suffix = "${var.environment}"
}