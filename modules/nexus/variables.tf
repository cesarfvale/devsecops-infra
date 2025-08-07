variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do Nexus"
  type        = string
  default     = "sonatype/nexus3:latest"
}

variable "container_name" {
  description = "Nome do container Nexus"
  type        = string
  default     = "nexus"
}

variable "port_internal" {
  description = "Porta interna do Nexus"
  type        = number
  default     = 8081
}

variable "port_external" {
  description = "Porta externa exposta do Nexus"
  type        = number
  default     = 8081
}

variable "data_volume_path" {
  description = "Diretório local para persistência de dados do Nexus"
  type        = string
  default     = "/../../data/nexus"
}
