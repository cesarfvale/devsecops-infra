variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do SonarQube"
  type        = string
  default     = "sonarqube:community"
}

variable "container_name" {
  description = "Nome do container SonarQube"
  type        = string
  default     = "sonarqube"
}

variable "port_internal" {
  description = "Porta interna do SonarQube"
  type        = number
  default     = 9000
}

variable "port_external" {
  description = "Porta externa exposta do SonarQube"
  type        = number
  default     = 9000
}

variable "data_volume_path" {
  description = "Diretório de volume persistente local para SonarQube"
  type        = string
  default     = "/../../data/sonarqube"
}
