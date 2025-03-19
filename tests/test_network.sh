#!/bin/bash
# Test network connectivity for installation

# Test internet connectivity
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: No internet connection"
    exit 1
fi

# Test DNS resolution
ping -c 1 github.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: DNS resolution failed"
    exit 1
fi

# Test package repository access
curl -s https://archive.ubuntu.com/ubuntu/ > /dev/null
if [ $? -ne 0 ]; then
    echo "ERROR: Cannot access Ubuntu repositories"
    exit 1
fi

echo "Network tests passed successfully!"
exit 0
