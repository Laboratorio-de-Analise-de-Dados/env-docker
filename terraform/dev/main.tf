module "aws-prod" {
  source         = "../../infra"

  # main.tf
  regiao_aws     = "us-east-1"

  # instancia.tf
  ami_id         = "ami-08c40ec9ead489470"
  instancia      = "t2.medium" # "d3.8xlarge"
  chave          = "iac-base"
  tamanho_volume = 80
  nome_maquina   = "env-docker"
  instala        = true
  
  # grupo_segur.tf
  nome_grupo_seg = "grupo-seg-base"
  ipv4_ip        = "0.0.0.0/0"
  ipv6_ip        = "::/0"
}

output "IP" {
  value          = module.aws-prod.IP_publico
}
