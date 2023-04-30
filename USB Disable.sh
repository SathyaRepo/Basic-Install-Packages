#!/bin/bash

# Create a new rule to disable USB mass storage access
echo 'ACTION=="add", SUBSYSTEMS=="usb", DRIVERS=="usb-storage", RUN+="/bin/sh -c '\''modprobe -r usb-storage'\''"' | sudo tee /etc/udev/rules.d/99-disable-usb-storage.rules

# Reload the udev rules to apply the changes
sudo udevadm control --reload-rules

echo "USB mass storage access disabled successfully."
