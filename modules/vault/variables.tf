variable "network_name" {
  description = "Nome da rede Docker"
  type        = string
}

variable "image" {
  description = "Imagem Docker do Vault"
  type        = string
  default     = "hashicorp/vault:latest"
}

variable "container_name" {
  description = "Nome do container Vault"
  type        = string
  default     = "vault"
}

variable "port_internal" {
  description = "Porta interna do Vault"
  type        = number
  default     = 8200
}

variable "port_external" {
  description = "Porta externa exposta do Vault"
  type        = number
  default     = 8200
}
