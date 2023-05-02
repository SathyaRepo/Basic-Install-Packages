#!/bin/bash

# Disable tab discarding to improve tab switching performance
chromium-browser --disable-features=TabDiscarding

# Enable hardware acceleration for smoother video playback
echo "export ENABLE_VULKAN=1" >> ~/.profile

# Increase the GPU memory allocation to improve graphics performance
echo "gpu_mem=512" | sudo tee -a /boot/firmware/usercfg.txt > /dev/null

# Enable smooth scrolling for a better browsing experience
echo "export CHROMIUM_FLAGS=--enable-smooth-scrolling" >> ~/.profile

# Enable tab discarding when Chromium is running out of memory
#echo "export CHROMIUM_FLAGS=--enable-tab-discarding" >> ~/.profile

# Disable unnecessary plugins
#sudo rm /etc/chromium-browser/default/plugins/*

# Disable unnecessary extensions
#sudo rm -rf /etc/chromium-browser/default/Extensions/*

# Clear cache and browsing data
#chromium-browser --clear-cache --clear-browsing-data

# Reboot the system to apply the changes
sudo reboot
