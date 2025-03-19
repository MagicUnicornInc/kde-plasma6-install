#!/bin/bash
# Test disk space and filesystem requirements

# Check root partition size
root_space=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
if [ "$root_space" -lt 20 ]; then
    echo "ERROR: Insufficient space in root partition (< 20GB)"
    exit 1
fi

# Check filesystem type
fs_type=$(df -T / | awk 'NR==2 {print $2}')
if [[ ! "$fs_type" =~ ^(ext4|xfs|btrfs)$ ]]; then
    echo "WARNING: Filesystem $fs_type might not be optimal"
fi

# Check inode usage
inode_usage=$(df -i / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$inode_usage" -gt 90 ]; then
    echo "ERROR: High inode usage (> 90%)"
    exit 1
fi

echo "Disk space tests passed successfully!"
exit 0
