terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Criação da rede DevSecOps
resource "docker_network" "devsecops" {
  name = var.network_name
}

# Módulos
module "jenkins" {
  source        = "./modules/jenkins"
  network_name  = docker_network.devsecops.name
}

module "vault" {
  source        = "./modules/vault"
  network_name  = docker_network.devsecops.name
}

module "prometheus" {
  source           = "./modules/prometheus"
  network_name     = docker_network.devsecops.name
  config_host_path = abspath("${path.module}/prometheus")
}

module "grafana" {
  source           = "./modules/grafana"
  network_name     = docker_network.devsecops.name
  data_volume_path = abspath("${path.module}/data/grafana")
}

module "sonarqube" {
  source           = "./modules/sonarqube"
  network_name     = docker_network.devsecops.name
  data_volume_path = abspath("${path.module}/data/sonarqube")
}

module "nexus" {
  source           = "./modules/nexus"
  network_name     = docker_network.devsecops.name
  data_volume_path = abspath("${path.module}/data/nexus")
}

module "gitlab" {
  source           = "./modules/gitlab"
  network_name     = docker_network.devsecops.name
  data_volume_path = abspath("${path.module}/data/gitlab")
}
