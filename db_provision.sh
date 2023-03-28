#!/bin/bash
# provision DB Version 1.1
# Make By Rui Paiva

# Atualizar o repositório de pacotes
apt-get update

# Instalar pacotes necessários
apt-get install -y mysql-server php-mysql

# Criar banco de dados, user e permissões
mysql -uroot -proot -e "CREATE DATABASE wordpress;"
mysql -uroot -proot -e "CREATE USER wordpress@localhost IDENTIFIED BY 'wordpress';"
mysql -uroot -proot -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;"
mysql -uroot -proot -e "FLUSH PRIVILEGES;"

# Informar que a criação do banco de dados foi concluída
echo "Base de dados criada com sucesso."

# Reiniciar o serviço do MySQL, se necessário
service mysql restart
