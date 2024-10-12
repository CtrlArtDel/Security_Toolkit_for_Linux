#!/bin/bash

LOGFILE="$HOME/security-logs/rootkit_scan.log"
SUMMARYLOG="$HOME/security-logs/suspicious_activity.log"

# Run Rootkit Hunter and log any issues
SUSPICIOUS=$(sudo rkhunter --check --rwo)

if [[ -n "$SUSPICIOUS" ]]; then
    echo "[$(date)] Rootkit scan found issues!" >> $LOGFILE
    echo "$SUSPICIOUS" >> $LOGFILE
    echo "[$(date)] Rootkit issues found and logged." >> $SUMMARYLOG
    echo "$SUSPICIOUS" >> $SUMMARYLOG
fi

