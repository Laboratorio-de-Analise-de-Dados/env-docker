resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instancia
  key_name               = var.chave

  ebs_block_device {
    device_name          = "/dev/sda1"
    volume_size          = var.tamanho_volume
  }

  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id, aws_security_group.acesso-http.id]
  user_data                  = var.instala ? filebase64("ansible.sh") : ""

  tags = {
    Name                 = var.nome_maquina
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name               = var.chave
  public_key             = file("${var.chave}.pub")
}

output "IP_publico" {
  value                  = aws_instance.app_server.public_ip
}