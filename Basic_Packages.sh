#!/bin/bash

# Install Chromium
sudo apt-get update
sudo apt-get install -y chromium-browser

# Install ClamAV and ClamTk
sudo apt-get install -y clamav clamtk

# Install UFW
sudo apt-get install -y ufw
sudo ufw enable

# Install OpenSSH
sudo apt-get install -y openssh-server

# Install ecryptfs-utils and dmsetup
sudo apt-get install -y ecryptfs-utils dmsetup

# Install NTP
sudo apt-get install -y ntp

# Restart NTP service
sudo systemctl restart ntp

echo "All packages installed successfully."
