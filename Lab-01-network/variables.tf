#Criação de VPC
variable "cidr_vpc" {
  type = string
  description = "cidr block vpc"
  default = "10.0.0.0/16"
}

variable "subnet_public" {
  type        = string
  description = "Bloco CIDR para a subnet pública"
  default     = "10.0.1.0/24"
}

variable "subnet_private" {
  type        = string
  description = "Bloco CIDR para a subnet privada"
  default     = "10.0.2.0/24"
}
