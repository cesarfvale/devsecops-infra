variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do Grafana"
  type        = string
  default     = "grafana/grafana:latest"
}

variable "container_name" {
  description = "Nome do container Grafana"
  type        = string
  default     = "grafana"
}

variable "port_internal" {
  description = "Porta interna do Grafana"
  type        = number
  default     = 3000
}

variable "port_external" {
  description = "Porta externa exposta do Grafana"
  type        = number
  default     = 3000
}

variable "data_volume_path" {
  description = "Caminho local para armazenar os dados persistentes do Grafana"
  type        = string
  default     = "/../../data/grafana"
}
