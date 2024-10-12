#!/bin/bash

# Introduction message
echo "Welcome to Linux Security Master Setup"
echo "This script will install and configure key security tools to harden your Linux system."

# Step 1: Installing essential security tools
echo "Step 1: Installing essential security tools..."
sudo apt update
sudo apt install -y nmap rkhunter aide ufw clamav wireshark suricata auditd lynis unattended-upgrades libapache2-mod-security2

# Step 2: Configure firewall
echo "Step 2: Configuring the firewall (UFW)..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
echo "Firewall configured to deny all incoming connections except SSH."

# Step 3: SSH hardening and enforcing strong password policies
echo "Step 3: Hardening SSH and enforcing strong password policies..."
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo service ssh restart
sudo echo "minlen=12" >> /etc/security/pwquality.conf
echo "Minimum password length set to 12 characters. SSH hardened by disabling root login and password-based login."

# Step 4: Setting up unattended upgrades
echo "Step 4: Enabling automatic updates..."
sudo apt install unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades
echo "Unattended upgrades enabled for security updates."

# Step 5: Initialize AIDE (File Integrity Monitoring)
echo "Step 5: Setting up AIDE (Advanced Intrusion Detection Environment)..."
sudo aideinit
sudo mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
echo "AIDE initialized and ready to monitor file integrity."

# Step 6: Configure rootkit scanner (RKHunter)
echo "Step 6: Setting up rootkit detection (RKHunter)..."
sudo rkhunter --propupd
echo "RKHunter initialized."

# Step 7: Setting up directories for logs and scripts
echo "Step 7: Setting up directories for logs and security scripts..."
mkdir -p ~/security-logs
mkdir -p ~/security-scripts

# Step 8: Moving security scripts
echo "Step 8: Moving security scripts..."
mv check_login_attempts.sh network_monitor.sh rootkit_scanner_script.sh scan_network_devices.sh scan_router_ports.sh ~/security-scripts/
chmod +x ~/security-scripts/*.sh
echo "Security scripts moved and made executable."

# Step 9: Configure cron jobs for regular scans
echo "Step 9: Configuring cron jobs for hourly security checks..."
(crontab -l ; echo "0 * * * * /bin/bash ~/security-scripts/check_login_attempts.sh") | crontab -
(crontab -l ; echo "0 * * * * /bin/bash ~/security-scripts/network_monitor.sh") | crontab -
(crontab -l ; echo "0 * * * * /bin/bash ~/security-scripts/rootkit_scanner_script.sh") | crontab -
(crontab -l ; echo "0 * * * * /bin/bash ~/security-scripts/scan_network_devices.sh") | crontab -
(crontab -l ; echo "0 * * * * /bin/bash ~/security-scripts/scan_router_ports.sh") | crontab -
echo "Cron jobs have been configured to run hourly security scans."


echo "Setup complete! Your system is now secured with the Linux Security Master Toolkit."

