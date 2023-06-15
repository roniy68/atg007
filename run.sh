#!/bin/bash

# Update system packages
sudo apt update

# Install OpenSSH server
sudo apt install openssh-server -y

# back up 
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bk
# Configure SSH to allow password authentication
sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Enable UFW (Uncomplicated Firewall)
sudo ufw enable

# Allow SSH traffic through UFW
sudo ufw allow ssh

# Restart SSH service to apply changes
sudo systemctl restart sshd
