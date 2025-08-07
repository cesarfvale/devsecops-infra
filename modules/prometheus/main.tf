resource "docker_image" "prometheus" {
  name = var.image
}

resource "docker_container" "prometheus" {
  name  = var.container_name
  image = docker_image.prometheus.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  volumes {
    container_path = "/etc/prometheus/prometheus"
    host_path      = abspath(var.config_host_path)
  }

  networks_advanced {
    name = var.network_name
  }
}
