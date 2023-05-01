#!/bin/bash

# Disable unneeded services
#sudo systemctl disable snapd.service
#sudo systemctl disable apt-daily.service
sudo systemctl disable bluetooth.service
#sudo systemctl disable cups-browsed.service
#sudo systemctl disable NetworkManager-wait-online.service

# Enable ZRAM
sudo apt-get install zram-config -y

# Increase GPU memory
echo "gpu_mem=512" | sudo tee -a /boot/firmware/usercfg.txt

# Set CPU scaling governor to "performance"
echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Disable swap to prevent SD card wear
#sudo swapoff -a
#sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Reboot the system to apply the changes
sudo reboot
