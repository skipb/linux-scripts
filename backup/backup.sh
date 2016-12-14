#!/bin/bash
# Simple backup.
# v0.8.9

# Usage example
# Default, uses the default settings to handle a quick backup.
## ./backup.sh
#
# Alt destination
## ./backup.sh -d /run/media/skip/sbu1
## ./backup.sh -d skip@remote.example.com -p 2222 -r 1

# Default settings.
SOURCE=$HOME
PORT=22
DEST=/run/media/skip/sbu0
REM=0 # Use 0 for local and 1 for remote.

# Define option switches.
while getopts 'p:d:r:' opt ; do
  case $opt in
    p) PORT=$OPTARG ;;
    d) DEST=$OPTARG ;;
    r) REM=$OPTARG ;;
  esac
done

# Local backup. (-r 0). Modify as needed.
if [ $REM -eq 0 ]; then
  echo "Local backup selected."
  echo $SOURCE - $DEST

  echo "Workspace..."
  rsync -avz $SOURCE/workspace $DEST/

  echo "Music..."
  rsync -avz $SOURCE/Dropbox/Music/ $DEST/Media/Music/mp3/
  echo "Videos..."
  rsync -avz $SOURCE/Videos $DEST/Media/
  echo "Books..."
  rsync -avz $SOURCE/Dropbox/Books $DEST/Media/
  echo "Documents..."
  rsync -avz $SOURCE/Documents $DEST/

  echo "Config Files"
  tar cvjf $DEST/backups/latptop-config.tar.bz2 $SOURCE/.config $SOURCE/.atom $SOURCE/.oh-my-zsh $SOURCE/.ssh $SOURCE/.zshrc $SOURCE/.gitconfig
else
  # Remote backup. Again, modify as needed.
  echo "Remote backup selected."
  echo $SOURCE - $DEST "-p " $PORT

  echo "Workspace..."
  rsync -avz -e "ssh -p $PORT" $SOURCE/workspace $DEST:~/
  echo "Documents..."
  rsync -avz -e "ssh -p $PORT" $SOURCE/Documents $DEST:~/

  echo "Config Files"
  tar cvjf - $SOURCE/.config $SOURCE/.atom $SOURCE/.oh-my-zsh $SOURCE/.ssh $SOURCE/.zshrc $SOURCE/.gitconfig | ssh $DEST -p $PORT "cat > ~/backups/laptop-config.tar.bz2"
fi
