terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Rede Docker
resource "docker_network" "devsecops" {
  name = "devsecops_net"
}

# Jenkins (CI/CD)
resource "docker_image" "jenkins" {
  name = "jenkins/jenkins:lts"
}

# Prometheus (Monitoring)
resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

# Vault (Secret Management)
resource "docker_image" "vault" {
  name = "hashicorp/vault:latest"
}

# SonarQube (Code Quality)
resource "docker_image" "sonarqube" {
  name = "sonarqube:community"
}

# Nexus (Artifact Repository)
resource "docker_image" "nexus" {
  name = "sonatype/nexus3:latest"
}

# GitLab (Version Control)
resource "docker_image" "gitlab" {
  name = "gitlab/gitlab-ce:latest"
}

# Grafana (Dashboarding)
resource "docker_image" "grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "jenkins" {
  name  = "jenkins"
  image = docker_image.jenkins.name

  ports {
    internal = 8080
    external = 8080
  }

  networks_advanced {
    name = docker_network.devsecops.name
  }
}

# Vault (Secret Management)
resource "docker_container" "vault" {
    name  = "vault"
    image = docker_image.vault.name
    ports {
      internal = 8200
      external = 8200
    }
    env = [
      "VAULT_DEV_ROOT_TOKEN_ID=root",
      "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200"
    ]

    networks_advanced {
      name = docker_network.devsecops.name
    }
}

# Prometheus (Monitoring)
resource "docker_container" "prometheus" {
  name = "prometheus"
  image = docker_image.prometheus.name
  ports {
    internal = 9090
    external = 9090
  }
  volumes {
    container_path = "/etc/prometheus/prometheus"
    host_path      = abspath("${path.module}/prometheus")
  }
  networks_advanced {
    name = docker_network.devsecops.name
  }
}   

resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.name

  ports {
    internal = 3000
    external = 3000
  }

  networks_advanced {
    name = docker_network.devsecops.name
  }
}

resource "docker_container" "sonarqube" {
  name  = "sonarqube"
  image = docker_image.sonarqube.name
  ports {
    internal = 9000
    external = 9000
  }
  env = [
    "SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true"
  ]
  networks_advanced {
    name = docker_network.devsecops.name
  }
}

resource "docker_container" "nexus" {
  name  = "nexus"
  image = docker_image.nexus.name
  ports {
    internal = 8081
    external = 8081
  }
  networks_advanced {
    name = docker_network.devsecops.name
  }
}

resource "docker_container" "gitlab" {
  name  = "gitlab"
  image = docker_image.gitlab.name
  ports {
    internal = 80
    external = 8090
  }
  networks_advanced {
    name = docker_network.devsecops.name
  }
  env = [
    "GITLAB_HOST=localhost",
    "GITLAB_PORT=8090",
    "GITLAB_SSH_PORT=22"
  ]
}

