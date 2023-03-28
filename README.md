# Vagrant multi vm apache and mysql for Wordpress
Use Vagrant and VirtualBox to set up multiple VMs on a private network: one Apache Server and one MySQL DB that receives and stores the data.


Created by Rui Paiva on 28/03/2023


## Install
*1 - vagrant up
## Use



##
Finally, in a terminal session open the configuration file in nano:
```sudo -u www-data nano /srv/www/wordpress/wp-config.php```

Find the following:
```
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );
```
Delete those lines (ctrl+k will delete a line each time you press the sequence). Then replace with the content of https://api.wordpress.org/secret-key/1.1/salt/. (This address is a randomiser that returns completely random keys each time it is opened.) This step is important to ensure that your site is not vulnerable to “known secrets” attacks.

Save and close the configuration file by typing ctrl+x followed by y then enter
##




## SOME USEFUL COMMAND LINE COMMANDS:

SSH into virtual machine.<br>
```$ vagrant ssh```

Start virtual machine.<br>
```$ vagrant up```

Share your virtual machine to the world via a temporary and unique url.<br>
```$ vagrant share```

Halt virtual machine.<br>
```$ vagrant halt```

Destroy your virtual machine. The source code and the content of the data directory will remain unchanged. Only the VirtualBox machine instance will be destroyed. You can build your machine again with the 'vagrant up' command. This command is useful if you want to save disk space.
Warning: this command will destroy your site databases. Backup them using drush sql-dump > db.sql for each site.<br>
```$ vagrant destroy```

Reconfigure the virtual machine after a source code change.<br>
```$ vagrant provision```

Reload the virtual machine. Useful when you need to change network or synced folder settings.<br>
```$ vagrant reload```

Visit for more information: https://developer.hashicorp.com/vagrant/docs

## SOME USEFUL MYSQL COMMANDS:
to connect to MySQL server<br>
```mysql -u username -p``` 
		(default username = root, password = rootpass)<br><br>
to list available databases<br>
```SHOW DATABASES;``` <br><br>
to change databases<br>
```USE databasename;``` <br><br>
to create database<br>
```CREATE DATABASE databasename;```  <br><br>
to delete database<br>
```DROP DATABASE databasename;``` <br><br>
to see available database tables<br>
```SHOW tables;``` <br><br>
to see overview of table (field, type, etc)<br>
```DESCRIBE tablename;``` <br><br>
    to create a table in the current database<br>
		- columnJ is the label of the column<br>
		- TYPE can be things like: VARCHAR(maxnumofchars), CHAR(1),<br>
			DATE<br>
```CREATE TABLE tablename (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, column1 TYPE, column2 TYPE,..., columnN TYPE);``` <br><br>
to insert a row of info in the current database<br>
```INSERT INTO 'tablename' ('id','column1val',...,'columnNval');``` <br><br>
to see the info in this table<br>
```SELECT * FROM tablename;``` <br><br>
to delete a row	in this table where the column has this value<br>
```DELETE from tablename where columnname=fieldtext;```<br><br> 

```mysql -h localhost -u wordpress -p wordpress```

## alterar pw do root
sudo mysql -u root
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'YOUR_PASSWORD_HERE';
FLUSH PRIVILEGES;

```mysql -u root -p # and it works```

##

## Adicionar permissão remota. ATENÇÃO: tem de ser a todos os remotos
```CREATE USER wordpress@192.168.3.5 IDENTIFIED BY 'wordpress';
GRANT ALL PRIVILEGES ON *.* TO wordpress@192.168.3.5;
flush privileges;
```
## FAQS

hZQfY@u@RUm2r@WiHi