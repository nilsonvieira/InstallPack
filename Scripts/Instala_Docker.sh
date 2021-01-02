#!/bin/bash

# Instalação do Docker e do Compose
# Instalação:
# - Ubuntu 20.04 (Focal Fossa)
# - Mint 20 (Ulyana)

_DISTRO=1

echo "-----------------------------------------------------------------"
echo "              Removendo pacotes desnecessários                   "
echo "-----------------------------------------------------------------"

sudo apt-get remove \
    docker \
    docker-engine \
    docker.io \
    containerd \
    runc -y

echo "-----------------------------------------------------------------"
echo "     Atualizando repositórios e Instalando dependências          "
echo "-----------------------------------------------------------------"

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "-----------------------------------------------------------------"
echo "                     Instalando Docker                           "
echo "-----------------------------------------------------------------"

DockerDebian(){
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian  buster  stable"
}

DockerUbuntu(){
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  focal stable"
}

if [[ $_DISTRO == 1]]; then
    DockerDebian
elif [[$_DISTRO == 2]]
    DockerUbuntu
else 
    echo "Apenas Disponível para:
    - Debian (Buster)
    - Deepin 20
    - Mint (Ulyana)
    - Ubuntu (Focal Fossa)"
fi

sudo apt-get update
sudo apt-get install -y\
    docker-ce \
    docker-ce-cli \
    containerd.io

echo "-----------------------------------------------------------------"
echo "                     Atribuindo Permissões                       "
echo "-----------------------------------------------------------------"

sudo usermod -aG docker $USER
sudo systemctl start docker

echo "-----------------------------------------------------------------"
echo "                     Instalando Docker Compose                   "
echo "-----------------------------------------------------------------"

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
