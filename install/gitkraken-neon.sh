#!/bin/bash
# KDE Neon, GitKraken will not launch without a few missing dependencies.
# This should not be a problem, but, Axosoft did not do a good job of dependency
# checks when building their packages.

sudo apt install curl libcurl libcurl4-openssl-dev libgnome-keyring0 -y
sudo dpkg -i ~/Downloads/gitkraken-amd64.deb
