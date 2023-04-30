#!/bin/bash

# Remove the udev rule that disabled USB mass storage access
sudo rm /etc/udev/rules.d/99-disable-usb-storage.rules

# Reload the udev rules to apply the changes
sudo udevadm control --reload-rules

echo "USB mass storage access enabled successfully."
