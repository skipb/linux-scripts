#!/bin/bash
# Scripts to install requirments for Don Meltons video_transcoding. MakeMKV is also installed for DVD/Bluray ripping.
# This should work with Fedora 25.

## Add needed repos.
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-multimedia.repo

## update
sudo dnf update -y

## Install dependencies
sudo dnf install -y ruby HandBrake-cli makemkv ffmpeg mkvtoolnix libmp4v2 libdvdcss mplayer

## Append to path
echo "You will probably need to add Ruby to your PATH. $(ruby -e "print Gem.user_dir")/bin"

## Install Video_Transcoding Tools
sudo gem install video_transcoding

echo "Done! You should probably reboot."
