#!/bin/bash

# Check if the user has root privileges
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Add blacklist rules to disable USB mass storage access
echo "blacklist usb_storage" >> /etc/modprobe.d/blacklist.conf
echo "blacklist uas" >> /etc/modprobe.d/blacklist.conf

# Remove any existing instances of the USB storage kernel modules
rmmod usb_storage uas

# Update the initramfs to ensure the blacklist rules are applied at boot time
update-initramfs -u

# Inform the user that the script has completed successfully
echo "USB mass storage access has been disabled."
