variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do GitLab CE"
  type        = string
  default     = "gitlab/gitlab-ce:latest"
}

variable "container_name" {
  description = "Nome do container GitLab"
  type        = string
  default     = "gitlab"
}

variable "port_internal" {
  description = "Porta interna do GitLab"
  type        = number
  default     = 80
}

variable "port_external" {
  description = "Porta externa exposta do GitLab"
  type        = number
  default     = 8090
}

variable "data_volume_path" {
  description = "Diretório local base para os dados persistentes do GitLab"
  type        = string
  default     = "/../../data/gitlab"
}

variable "env_vars" {
  description = "Variáveis de ambiente do GitLab"
  type        = list(string)
  default     = [
    "GITLAB_OMNIBUS_CONFIG=external_url 'http://localhost:8090'; gitlab_rails['gitlab_shell_ssh_port'] = 22"
  ]
}
