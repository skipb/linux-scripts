#!/bin/bash

# Add PPA's that I use.
sudo apt-add-repository ppa:numix/ppa
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt-add-repository ppa:webupd8team/sublime-text-3

# Update
sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

# Install programs I commonly use.
sudo apt-get install ssh ubuntu-restricted-extras ubuntu-restricted-addons build-essential git numix-gtk-theme numix-icon-theme-circle sublime-text-installer vlc python-gpgme ssh

# Starting SSH. Don't forget to change the port and turn off password access.
sudo service ssh start

# Install liquidprompt
cd ~/
git clone https://github.com/nojhan/liquidprompt.git
echo "[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt" >> ~/.bashrc

echo "Done. You should probably reboot."
