#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php php-mysql
sudo systemctl restart apache2
