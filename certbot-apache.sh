#!/bin/bash

# Define log file
LOG_FILE="/var/log/certbot-automation.log"

# Ensure log directory exists
sudo mkdir -p /var/log
sudo touch $LOG_FILE
sudo chmod 644 $LOG_FILE

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | sudo tee -a $LOG_FILE
}

# Prompt user for domain and email
read -p "Enter your domain (e.g., example.com): " DOMAIN
read -p "Enter your email for SSL notifications: " EMAIL

CERTBOT_AUTO_RENEW="/etc/cron.d/certbot-auto-renew"

# Update system and install Certbot if not installed
log_message "Checking and installing Certbot..."
if ! command -v certbot &> /dev/null
then
    sudo apt update && sudo apt install -y certbot python3-certbot-apache | sudo tee -a $LOG_FILE
    log_message "Certbot installed successfully."
else
    log_message "Certbot is already installed."
fi

# Obtain SSL certificate
log_message "Obtaining SSL certificate for $DOMAIN..."
if sudo certbot --apache -d $DOMAIN --non-interactive --agree-tos -m $EMAIL --redirect | sudo tee -a $LOG_FILE
then
    log_message "SSL certificate issued successfully for $DOMAIN."
else
    log_message "Error issuing SSL certificate for $DOMAIN. Check logs for details."
    exit 1
fi

# Set up automatic renewal
log_message "Setting up automatic renewal..."
echo "0 3 * * * root certbot renew --quiet" | sudo tee $CERTBOT_AUTO_RENEW > /dev/null
log_message "Auto-renewal cron job added."

# Restart Apache to apply changes
log_message "Restarting Apache..."
if sudo systemctl restart apache2
then
    log_message "Apache restarted successfully."
else
    log_message "Error restarting Apache."
    exit 1
fi

log_message "SSL setup completed successfully for $DOMAIN!"
