resource "docker_image" "jenkins" {
  name = var.image
}

resource "docker_container" "jenkins" {
  name  = var.container_name
  image = docker_image.jenkins.name

  ports {
    internal = var.port_internal
    external = var.port_external
  }

  networks_advanced {
    name = var.network_name
  }
}
