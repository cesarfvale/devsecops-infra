resource "docker_image" "nexus" {
  name = var.image
}

resource "docker_container" "nexus" {
  name  = var.container_name
  image = docker_image.nexus.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  volumes {
    container_path = "/nexus-data"
    host_path      = abspath(var.data_volume_path)
  }

  networks_advanced {
    name = var.network_name
  }
}
