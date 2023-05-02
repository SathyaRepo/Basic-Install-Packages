#!/bin/bash

# Check if the user has root privileges
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Remove the blacklist rules that were added to /etc/modprobe.d/blacklist.conf
sed -i '/blacklist usb_storage/d' /etc/modprobe.d/blacklist.conf
sed -i '/blacklist uas/d' /etc/modprobe.d/blacklist.conf

# Reboot the system to apply the changes
echo "USB mass storage access has been enabled. Rebooting the system in 5 seconds..."
sleep 5
reboot
