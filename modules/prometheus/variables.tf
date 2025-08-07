variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do Prometheus"
  type        = string
  default     = "prom/prometheus:latest"
}

variable "container_name" {
  description = "Nome do container Prometheus"
  type        = string
  default     = "prometheus"
}

variable "port_internal" {
  description = "Porta interna do Prometheus"
  type        = number
  default     = 9090
}

variable "port_external" {
  description = "Porta externa exposta do Prometheus"
  type        = number
  default     = 9090
}

variable "config_host_path" {
  description = "Caminho no host para o prometheus.yml"
  type        = string
  default     = "/../../prometheus"
}
