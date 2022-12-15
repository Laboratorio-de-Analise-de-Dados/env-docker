resource "aws_security_group" "acesso-ssh" {
  name               = "${var.nome_grupo_seg}-ssh"
  description        = "Permite acesso SSH"
  ingress{
    cidr_blocks      = [ var.ipv4_ip ]
    ipv6_cidr_blocks = [ var.ipv6_ip ]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }
  egress{
    cidr_blocks      = [ var.ipv4_ip ]
    ipv6_cidr_blocks = [ var.ipv6_ip ]
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }
  tags = {
    Name             = "${var.nome_grupo_seg}-ssh"
  }
}
resource "aws_security_group" "acesso-http" {
  name               = "${var.nome_grupo_seg}-http"
  description        = "Permite acesso HTTP"
  ingress{
    cidr_blocks      = [ var.ipv4_ip ]
    ipv6_cidr_blocks = [ var.ipv6_ip ]
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }
  egress{
    cidr_blocks      = [ var.ipv4_ip ]
    ipv6_cidr_blocks = [ var.ipv6_ip ]
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
  }
  tags = {
    Name             = "${var.nome_grupo_seg}-http"
  }
}
