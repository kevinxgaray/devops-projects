#!/bin/bash

# Function to get OS version
echo "OS Version:"
cat /etc/os-release | grep -E "^PRETTY_NAME" | cut -d '=' -f2 | tr -d '"'
echo ""

# Function to get system uptime
echo "System Uptime:"
uptime -p
echo ""

# Function to get system load average
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

# Function to get logged in users
echo "Logged in Users:"
who | awk '{print $1}' | sort | uniq -c
echo ""

# Function to get failed login attempts
echo "Failed Login Attempts:"
lastb | wc -l
echo ""

# Function to get total CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "User: "$2"%  System: "$4"%  Idle: "$8"%"}'
echo ""

# Function to get memory usage
echo "Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3*100/$2 }'
echo ""

# Function to get disk usage
echo "Disk Usage:"
df -h --total | grep 'total' | awk '{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $5 }'
echo ""

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

# Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
