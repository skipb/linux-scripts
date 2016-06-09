#!/bin/bash
# Cleanup incompatible packages
sudo apt-get remove --purge mplayer2

# The mplayer in Ubuntu's repos does not work correctly. We will add a ppa for mplayer that does work.
sudo apt-add-repository ppa:mc3man/mplayer-test
sudo apt-get update

#Install dependencies

#Ubuntu
sudo apt-get install -y ruby-full handbrake-cli ffmpeg mkvtoolnix libmp4v2-2 mplayer

#Arch
#sudo pacman -S ruby handbrake-cli ffmpeg mplayer mkvtoolnix-cli  libmp4v2

##Append to path
## $(ruby -e "print Gem.user_dir")/bin

# Install Video_Transcoding Tools
sudo gem install video_transcoding

echo "Done! You should probably reboot."
