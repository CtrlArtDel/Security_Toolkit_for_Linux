#!/bin/bash

LOGFILE="$HOME/security-logs/router_ports.log"
SUMMARYLOG="$HOME/security-logs/suspicious_activity.log"

# Scan router ports
PORTS=$(nmap -sT 192.168.1.1)

if [[ -n "$PORTS" ]]; then
    echo "[$(date)] Router port scan detected open ports!" >> $LOGFILE
    echo "$PORTS" >> $LOGFILE
    echo "[$(date)] Suspicious router ports found and logged." >> $SUMMARYLOG
    echo "$PORTS" >> $SUMMARYLOG
fi

