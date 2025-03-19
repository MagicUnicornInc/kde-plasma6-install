#!/bin/bash

# Test system requirements for KDE Plasma 6 installation

# Check Ubuntu version
if ! grep -q "Ubuntu 24.04" /etc/os-release; then
    echo "ERROR: This script requires Ubuntu 24.04"
    exit 1
fi

# Check available disk space
available_space=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
if [ "$available_space" -lt 20 ]; then
    echo "ERROR: Less than 20GB of free space available"
    exit 1
fi

# Check RAM
total_ram=$(free -g | awk '/^Mem:/{print $2}')
if [ "$total_ram" -lt 4 ]; then
    echo "ERROR: Less than 4GB of RAM detected"
    exit 1
fi

echo "All system requirements met!"
exit 0
