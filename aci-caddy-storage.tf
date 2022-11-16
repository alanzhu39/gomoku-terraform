resource "azurerm_resource_group" "rust-gomoku" {
  name     = "RG-USE-Rust-Gomoku"
  location = local.location
}

resource "azurerm_storage_account" "rust-gomoku" {
  name                      = "rustgomoku"
  resource_group_name       = azurerm_resource_group.rust-gomoku.name
  location                  = azurerm_resource_group.rust-gomoku.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
}

resource "azurerm_storage_share" "rust-gomoku" {
  name                 = "rust-gomoku-data"
  storage_account_name = azurerm_storage_account.rust-gomoku.name
	quota = 50
}

