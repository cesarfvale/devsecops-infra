resource "docker_image" "vault" {
  name = var.image
}

resource "docker_container" "vault" {
  name  = var.container_name
  image = docker_image.vault.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  env = [
    "VAULT_DEV_ROOT_TOKEN_ID=root",
    "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:${var.port_internal}"
  ]

  networks_advanced {
    name = var.network_name
  }
}
