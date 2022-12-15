# main.tf
variable "regiao_aws" {
  type = string
}

# instancia.tf
variable "ami_id" {
  type = string
}

variable "instancia" {
  type = string
}

variable "chave" {
  type = string
}

variable "tamanho_volume" {
  type = number
}

variable "nome_maquina" {
  type = string
}

variable "instala" {
  type = bool
}

# grupo_segur.tf
variable "nome_grupo_seg" {
  type = string
}

variable "ipv4_ip" {
  type = string
}

variable "ipv6_ip" {
  type = string
}
