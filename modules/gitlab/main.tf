resource "docker_image" "gitlab" {
  name = var.image
}

resource "docker_container" "gitlab" {
  name  = var.container_name
  image = docker_image.gitlab.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  volumes {
    container_path = "/etc/gitlab"
    host_path      = abspath("${var.data_volume_path}/config")
  }

  volumes {
    container_path = "/var/log/gitlab"
    host_path      = abspath("${var.data_volume_path}/logs")
  }

  volumes {
    container_path = "/var/opt/gitlab"
    host_path      = abspath("${var.data_volume_path}/data")
  }

  env = var.env_vars

  networks_advanced {
    name = var.network_name
  }
}
