Installing Magento 2 on Ubuntu 23.04

This README will walk you through installing Magento 2 on Ubuntu 23.04 using the provided install script.
Prerequisites

    Ubuntu 23.04 server
    Domain name pointed to the server
    SSH access to the server

Installation

Connect to your server via SSH:

    ssh username@server_ip

Create an unprivileged user to run Magento:

    useradd -m magento

Install dependencies:

    sudo apt install unzip php7.4 php7.4-fpm php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml php7.4-zip

Install Apache and enable PHP FPM:

    sudo apt install apache2  
    sudo a2enmod rewrite  
    sudo a2enmod php7.4

Install MariaDB:

    sudo apt install mariadb-server

Run mysql_secure_installation:

    sudo mysql_secure_installation

 Enter your database name, user, and password when prompted.

 Download the install script:

    wget 

Run the install script:
    sudo chmod 777 magento2-install.sh
    
    ./magento2-install.sh

Follow the prompts to complete the Magento 2 installation.
