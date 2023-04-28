#!/bin/bash

# Create user iGOP
sudo useradd -m -s /bin/bash iGOP

# Set password for user iGOP
echo "iGOP:iplon@123" | sudo chpasswd

# Add user iGOP to sudo group
sudo usermod -aG sudo iGOP

echo "User iGOP created successfully with full administrator access."
