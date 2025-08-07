output "jenkins_url" {
  value = module.jenkins.jenkins_url
}

output "vault_url" {
  value = module.vault.vault_url
}

output "prometheus_url" {
  value = module.prometheus.prometheus_url
}

output "grafana_url" {
  value = module.grafana.grafana_url
}

output "sonarqube_url" {
  value = module.sonarqube.sonarqube_url
}

output "nexus_url" {
  value = module.nexus.nexus_url
}

output "gitlab_url" {
  value = module.gitlab.gitlab_url
}
