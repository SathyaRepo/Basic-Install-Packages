#!/bin/bash

# Check if the user has root privileges
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Set the animation scaling factor to 0.75
gsettings set org.gnome.desktop.interface scaling-factor 0.75

# Disable animations
gsettings set org.gnome.desktop.interface enable-animations false

