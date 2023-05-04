#!/bin/bash

# Check if the user has root privileges
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Set the CPU priority of the Brave browser process to high
renice -n -10 $(pgrep brave)

# Increase the maximum number of connections per server
echo "net.ipv4.tcp_max_syn_backlog = 65536" >> /etc/sysctl.conf
echo "net.core.somaxconn = 65536" >> /etc/sysctl.conf

# Enable HTTP/2 and DNS prefetching
echo "enable-quic=true" >> /etc/brave-browser/net/prefs.js
echo "dns_prefetching=true" >> /etc/brave-browser/net/prefs.js

# Disable smooth scrolling and hardware acceleration
echo "scroll-animations=false" >> /etc/brave-browser/default/Preferences
echo "hardware_acceleration_mode=0" >> /etc/brave-browser/default/Preferences

echo "Brave UI optimization complete"
# Flush DNS cache
#systemd-resolve --flush-caches


# Restart the Brave browser
systemctl restart snap.brave.brave

