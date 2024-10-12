#!/bin/bash

LOGFILE="$HOME/security-logs/login_attempts.log"
SUMMARYLOG="$HOME/security-logs/suspicious_activity.log"

# Look for failed login attempts or suspicious activity in the logs
FAILED_LOGINS=$(sudo grep "Failed password" /var/log/auth.log)
ROOT_LOGIN=$(sudo grep "Accepted publickey" /var/log/auth.log | grep "root")
SUSPICIOUS_IPS=$(sudo grep "sshd.*Failed" /var/log/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr)

if [[ -n "$FAILED_LOGINS" ]]; then
    echo "[$(date)] Failed login attempts detected:" >> $LOGFILE
    echo "$FAILED_LOGINS" >> $LOGFILE
    echo "[$(date)] Failed login attempts detected and logged." >> $SUMMARYLOG
    echo "$FAILED_LOGINS" >> $SUMMARYLOG
fi

if [[ -n "$ROOT_LOGIN" ]]; then
    echo "[$(date)] Root login detected!" >> $LOGFILE
    echo "$ROOT_LOGIN" >> $LOGFILE
    echo "[$(date)] Root login detected and logged." >> $SUMMARYLOG
    echo "$ROOT_LOGIN" >> $SUMMARYLOG
fi

if [[ -n "$SUSPICIOUS_IPS" ]]; then
    echo "[$(date)] Multiple failed login attempts from suspicious IPs:" >> $LOGFILE
    echo "$SUSPICIOUS_IPS" >> $LOGFILE
    echo "[$(date)] Suspicious IP activity detected and logged." >> $SUMMARYLOG
    echo "$SUSPICIOUS_IPS" >> $SUMMARYLOG
fi

