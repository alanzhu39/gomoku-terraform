resource "azurerm_container_group" "rust-gomoku" {
  resource_group_name = "RG-USE-Rust-Gomoku"
  location            = local.location
  name                = "rust-gomoku"
  os_type             = "Linux"
  dns_name_label      = "rust-gomoku"
  ip_address_type     = "Public"

  container {
    name   = "rust-gomoku"
    image  = "registry.hub.docker.com/alanzhu39/rust-gomoku-39:latest"
    cpu    = "0.5"
    memory = "0.5"
  }

  container {
    name   = "caddy"
    image  = "caddy"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 443
      protocol = "TCP"
    }

    ports {
      port     = 80
      protocol = "TCP"
    }

    volume {
      name                 = "rust-gomoku-data"
      mount_path           = "/data"
      storage_account_name = azurerm_storage_account.rust-gomoku.name
      storage_account_key  = azurerm_storage_account.rust-gomoku.primary_access_key
      share_name           = azurerm_storage_share.rust-gomoku.name
    }

    commands = ["caddy", "reverse-proxy", "--from", "rust-gomoku.eastus.azurecontainer.io", "--to", "localhost:8080"]
  }
}

output "url" {
  value = "https://${azurerm_container_group.rust-gomoku.fqdn}"
  description = "URL"
}

