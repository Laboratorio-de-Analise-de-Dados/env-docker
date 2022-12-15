#!/bin/bash

cd /home/ubuntu

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
sudo python3 -m pip install ansible

tee -a playbook.yml > /dev/null <<EOT
- hosts: localhost
  tasks:
  - name: Verificando se o projeto já existe
    stat:
      path: /home/ubuntu/env-docker/config.sh
    register: projeto

  - name: Git Clone
    ansible.builtin.git:
      repo: https://github.com/Laboratorio-de-Analise-de-Dados/env-docker.git
      dest: /home/ubuntu/env-docker
      version: main
      force: yes
    when: not projeto.stat.exists

  - name: Modificando a instalação do Docker
    lineinfile:
      path: /home/ubuntu/env-docker/config.sh
      regexp: "sudo docker-compose"
      line: "sudo docker-compose -f /home/ubuntu/env-docker/docker/docker-compose-app.yml up -d"
      backrefs: yes

  - name : Modificando permissões do arquivo de configuração
    shell: "sudo chmod 746 /home/ubuntu/env-docker/config.sh"

  - name : Configurando do Ambiente
    shell: "cd /home/ubuntu/env-docker/; sudo ./config.sh"

EOT

ansible-playbook playbook.yml
