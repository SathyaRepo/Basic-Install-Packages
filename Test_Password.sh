#!/bin/bash

# Check if the user has root privileges
if [ $(id -u) -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# Install the necessary package
apt update
apt install libpam-pwquality -y

# Set the password policy for all users
sed -i '/^password\s+requisite\s+pam_pwquality.so/c\password requisite pam_pwquality.so minlen=8 maxlen=16' /etc/pam.d/common-password

# Set the password expiration and reset interval for all users
sed -i '/^PASS_MAX_DAYS/c\PASS_MAX_DAYS 90' /etc/login.defs

# Set the maximum number of wrong login attempts and cooldown period for all users
echo "auth required pam_tally2.so deny=5 unlock_time=300" >> /etc/pam.d/common-auth

# Inform the user that the script has completed successfully
echo "Password policy has been enforced for all users."
echo "Minimum password length: 8 characters"
echo "Maximum password length: 16 characters"
echo "Password expiration period: 90 days"
echo "Maximum 5 wrong login attempts allowed. Cooldown period: 5 minutes."
