#!/bin/bash
# provision wp_provision Version 1.1
# Make By Rui Paiva

# Configurar a ligação à BD
echo 'A iniciar a configuração do wordpress.'
sudo -u www-data cp /home/vagrant/wordpress/wp-config-sample.php /home/vagrant/wordpress/wp-config.php

# Substituir apenas '<your-password>'
sudo -u www-data sed -i 's/database_name_here/wordpress/' /home/vagrant/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /home/vagrant/wordpress/wp-config.php
#sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/wordpress/' /home/vagrant/wordpress/wp-config.php