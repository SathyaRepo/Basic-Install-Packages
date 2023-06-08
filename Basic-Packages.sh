#!/bin/bash
echo "Accessing Command Stream"
echo "Verifying system standby resources"

# Install Chromium and brave
sudo apt-get update
sudo apt-get install -y chromium-browser
sudo snap install brave

# Install ClamAV and ClamTk
sudo apt-get install -y clamav clamtk

echo "Anit-Malware installation loaded"

# Install UFW
sudo apt-get install -y ufw
sudo ufw enable

echo "Firewall up and running"

# Install OpenSSH
sudo apt-get install -y openssh-server

# Install ecryptfs-utils and dmsetup
sudo apt-get install -y ecryptfs-utils dmsetup

# Install NTP
sudo apt-get install -y ntp

# Restart NTP service
sudo systemctl restart ntp

echo "All packages installed successfully."
