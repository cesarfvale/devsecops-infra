variable "network_name" {
  description = "Nome da rede Docker a ser usada"
  type        = string
}

variable "image" {
  description = "Imagem do Jenkins"
  type        = string
  default     = "jenkins/jenkins:lts"
}

variable "container_name" {
  description = "Nome do container Jenkins"
  type        = string
  default     = "jenkins"
}

variable "port_internal" {
  description = "Porta interna do Jenkins"
  type        = number
  default     = 8080
}

variable "port_external" {
  description = "Porta externa do Jenkins"
  type        = number
  default     = 8080
}
