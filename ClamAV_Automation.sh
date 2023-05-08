#!/bin/bash

# Set the time for the daily scan
SCAN_TIME="02:00"

# Add a cron job to update the virus definitions every day at 1:00 AM
echo "0 1 * * * /usr/bin/freshclam" | sudo tee -a /etc/crontab > /dev/null

# Add a cron job to perform the daily scan at the specified time
echo "0 ${SCAN_TIME} * * * root /usr/bin/clamscan -r /" | sudo tee -a /etc/crontab > /dev/null

# Restart the cron service to apply the changes
sudo service cron restart

echo "ClamAV settings Updated"
