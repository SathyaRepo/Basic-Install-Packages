#!/bin/bash

# Set black screen delay to 3 minutes
gsettings set org.gnome.desktop.session idle-delay 180

# Set auto screen lock delay time to 5 minutes
gsettings set org.gnome.desktop.screensaver lock-delay 300

echo "Screen lock settings updated successfully."
