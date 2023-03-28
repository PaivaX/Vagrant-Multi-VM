# Vagrant multi vm apache and mysql for Wordpress
Use Vagrant and VirtualBox to set up multiple VMs on a private network: one Apache Server and one MySQL DB that receives and stores the data.


Created by Rui Paiva on 28/03/2023


## Instalação
*1 - vagrant up
## Uso

## FAQS


TO EXECUTE:
- Make sure you have a VagrantMultiAdditionalFiles folder in this directory
		that contains the form web page
- ```vagrant up``` to create both WebExampleBox (apache) and DBExampleBox (mysql)
- Should see WebExampleBox's web page in browser at 192.168.3.5
- Can ```vagrant ssh``` into either VM
		DBExampleBox default username = root, password = rootpass for mysql


##
Finally, in a terminal session open the configuration file in nano:

sudo -u www-data nano /srv/www/wordpress/wp-config.php
##

##
Find the following:

define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );
Delete those lines (ctrl+k will delete a line each time you press the sequence). Then replace with the content of https://api.wordpress.org/secret-key/1.1/salt/. (This address is a randomiser that returns completely random keys each time it is opened.) This step is important to ensure that your site is not vulnerable to “known secrets” attacks.

Save and close the configuration file by typing ctrl+x followed by y then enter
##




SOME USEFUL COMMAND LINE COMMANDS:
$ vagrant ssh
SSH into virtual machine.

$ vagrant up
Start virtual machine.

$ vagrant share
Share your virtual machine to the world via a temporary and unique url.

$ vagrant halt
Halt virtual machine.

$ vagrant destroy
Destroy your virtual machine. The source code and the content of the data directory will remain unchanged. Only the VirtualBox machine instance will be destroyed. You can build your machine again with the 'vagrant up' command. This command is useful if you want to save disk space.
Warning: this command will destroy your site databases. Backup them using drush sql-dump > db.sql for each site.

$ vagrant provision
Reconfigure the virtual machine after a source code change.

$ vagrant reload
Reload the virtual machine. Useful when you need to change network or synced folder settings.

SOME USEFUL MYSQL COMMANDS:
- ```mysql -u username -p``` to connect to MySQL server
		(default username = root, password = rootpass)
- ```SHOW DATABASES;``` to list available databases
- ```USE databasename;``` to change databases
- ```CREATE DATABASE databasename;``` to create database 
- ```DROP DATABASE databasename;``` to delete database
- ```SHOW tables;``` to see available database tables
- ```DESCRIBE tablename;``` to see overview of table (field, type, etc)
- ```CREATE TABLE tablename (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, column1 TYPE, column2 TYPE,..., columnN TYPE);``` 
    to create a table in the current database
		- columnJ is the label of the column
		- TYPE can be things like: VARCHAR(maxnumofchars), CHAR(1),
			DATE
- ```INSERT INTO 'tablename' ('id','column1val',...,'columnNval');``` to 
		insert a row of info in the current database
- ```SELECT * FROM tablename;``` to see the info in this table
- ```DELETE from tablename where columnname=fieldtext;``` to delete a row
		in this table where the column has this value

mysql -h localhost -u wordpress -p wordpress

## alterar pw do root
sudo mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'YOUR_PASSWORD_HERE';
FLUSH PRIVILEGES;

mysql -u root -p # and it works

##

## Adicionar permissão remota. ATENÇÃO: tem de ser a todos os remotos
CREATE USER wordpress@192.168.3.5 IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON *.* TO wordpress@192.168.3.5;
flush privileges;


hZQfY@u@RUm2r@WiHi