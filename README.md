# gomoku-terraform

Builds [rust-gomoku](https://github.com/alanzhu39/rust-gomoku) backend services to Microsoft Azure Container Instances with [Caddy](https://caddyserver.com/) in a sidecar for automatic HTTPS. Uses Terraform with the Azure Provider to manage configurations.

Based on the technical guide [Automatic HTTPS with Azure Container Instances (ACI)](https://itnext.io/automatic-https-with-azure-container-instances-aci-4c4c8b03e8c9) by Johann Gyger.
