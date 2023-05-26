# Create unprivileged user to run Magento
useradd -m magento

# Install dependencies as sudo  
sudo apt install unzip php7.4 php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml php7.4-zip

# Install Apache and enable PHP FPM
sudo apt install apache2  
sudo a2enmod rewrite  
sudo a2enmod php7.4

# Install MariaDB 
sudo apt install mariadb-server  

# Run mysql_secure_installation
sudo mysql_secure_installation

# Prompt user to enter database name, user, and password
read -p "Enter database name: " DB_NAME 
read -p "Enter database user: " DB_USER
read -p "Enter database password: " DB_PASSWORD

# Create database and user 
sudo mysql
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;
EXIT;

# Create directory for Magento and change owner to magento user
sudo mkdir /var/www/magento2
sudo chown magento:magento /var/www/magento2

# Download and extract latest Magento 2 as magento user 
su magento 
wget https://github.com/magento/magento2/archive/2.4.2.tar.gz
tar -xvf 2.4.2.tar.gz

# Move files to web root
mv magento2-2.4.2/* /var/www/magento2  

# Run setup:install as magento user
php /var/www/magento2/bin/magento setup:install \
  --base-url=http://yourdomain.com/ \
  --db-host=localhost --db-name=$DB_NAME --db-user=$DB_USER --db-password=$DB_PASSWORD \
  --admin-firstname=Admin --admin-lastname=MyStore  --admin-email=admin@example.com \
  --admin-user=admin --admin-password=password --language=en_US --currency=USD
