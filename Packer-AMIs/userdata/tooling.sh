#!/bin/bash

# Update package lists
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install -y dnf-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm 

# Install required packages
sudo yum install -y python3 net-tools vim wget git htop php

# Cloning the tooling site
git clone https://github.com/darey-io/tooling.git

# Move the Web Files to the html directory
# cd tooling/html
# sudo cp -R  * /var/www/html/