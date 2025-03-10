variable "cidr_block" {
  type = string
  description = "Cidr_block da VPC"
}


variable "cidr_block_subnet_public"{
  type = list(string)
  description = "Cidr_block da subnet public"
}

variable "cidr_block_subnet_private"{
  type = list(string)
  description = "Cidr_block da subnet private"
}

 #Variável para definir as AZs desejadas
variable "az_pub" {
  type    = list(string)
  description = "availability_zone  para subnet public"
}

variable "az_priv" {
  type    = list(string)
  description = "availability_zone  para subnet privado"
}

variable "availability_zones_suffix" {
  type    = list(string)
 
}