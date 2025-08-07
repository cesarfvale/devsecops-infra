resource "docker_image" "sonarqube" {
  name = var.image
}

resource "docker_container" "sonarqube" {
  name  = var.container_name
  image = docker_image.sonarqube.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  env = [
    "SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true"
  ]

  volumes {
    container_path = "/opt/sonarqube/data"
    host_path      = abspath("${var.data_volume_path}/data")
  }

  volumes {
    container_path = "/opt/sonarqube/logs"
    host_path      = abspath("${var.data_volume_path}/logs")
  }

  volumes {
    container_path = "/opt/sonarqube/extensions"
    host_path      = abspath("${var.data_volume_path}/extensions")
  }

  networks_advanced {
    name = var.network_name
  }
}
