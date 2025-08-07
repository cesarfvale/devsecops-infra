resource "docker_image" "grafana" {
  name = var.image
}

resource "docker_container" "grafana" {
  name  = var.container_name
  image = docker_image.grafana.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  volumes {
    container_path = "/var/lib/grafana"
    host_path      = abspath(var.data_volume_path)
  }

  networks_advanced {
    name = var.network_name
  }
}
