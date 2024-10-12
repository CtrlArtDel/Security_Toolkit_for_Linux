#!/bin/bash

LOGFILE="$HOME/security-logs/network_monitor.log"
SUMMARYLOG="$HOME/security-logs/suspicious_activity.log"

# Run network monitor script and grep for suspicious traffic
SUSPICIOUS=$(ss -tuln | grep -E ':6666|:1337|:4444|:5555|:8080')

if [[ -n "$SUSPICIOUS" ]]; then
    echo "[$(date)] Suspicious network traffic detected!" >> $LOGFILE
    echo "$SUSPICIOUS" >> $LOGFILE
    echo "[$(date)] Suspicious network traffic found and logged." >> $SUMMARYLOG
    echo "$SUSPICIOUS" >> $SUMMARYLOG
fi

