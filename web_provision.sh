#!/bin/bash
#provision WebBox Version 0.0.0
# Escrito por Rui Paiva

# Instala todos os pacotes necessários
sudo apt-get update
sudo apt-get install -y apache2 ghostscript libapache2-mod-php php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql mysql-client php-xml php-zip
echo "Serviços instalados!"

# Efetuar o download e instalar na pasta partilhada
echo "A preparar para instalar o Wordpress."
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /home/vagrant/

# Copiar o ficheiro de configuração do apache para wordpress
cp ./wordpress.conf /etc/apache2/sites-available/wordpress.conf
echo "Wordpress instalado com sucesso."

# Ativar o site
sudo a2ensite wordpress
# Ativar o URL rewriting
sudo a2enmod rewrite
# Desativar o site default
sudo a2dissite 000-default
# Reiniciar o serviço, para aplicar todas as alterações
systemctl reload apache2