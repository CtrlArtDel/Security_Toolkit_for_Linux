#!/bin/bash

LOGFILE="$HOME/security-logs/network_devices.log"
SUMMARYLOG="$HOME/security-logs/suspicious_activity.log"

# Scan for devices on the network
DEVICES=$(nmap -sn 192.168.1.0/24)

# Check for suspicious devices (customize this based on your needs)
if [[ -n "$DEVICES" ]]; then
    echo "[$(date)] Network device scan completed!" >> $LOGFILE
    echo "$DEVICES" >> $LOGFILE
    echo "[$(date)] Suspicious network devices found and logged." >> $SUMMARYLOG
    echo "$DEVICES" >> $SUMMARYLOG
fi

