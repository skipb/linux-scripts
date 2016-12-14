#!/bin/bash

# Update
sudo apt-get update && sudo apt-get dist-upgrade

# Install SSH
sudo apt-get install ssh ufw

# Starting SSH. Don't forget to change the port and turn off password access.
sudo service ssh start

# Setting up the firewall.

# Allow ssh
sudo ufw allow 22/tcp

# Allow HTTP and HTTPS
#sudo ufw allow 80/tcp
#sudo ufw allow 443/tcp

sudo ufw enable

echo "Done! It is probably a good idea to reboot." 
