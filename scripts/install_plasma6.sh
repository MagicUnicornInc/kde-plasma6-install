#!/bin/bash
set -e

# Function to print messages with timestamps
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "Adding KDE Plasma 6 repositories..."
# Add KDE Neon repositories for Plasma 6
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E6D4736255751E5D
echo "deb http://archive.neon.kde.org/unstable focal main" | sudo tee /etc/apt/sources.list.d/neon.list

log "Updating package lists..."
sudo apt update

log "Installing KDE Plasma 6..."
sudo apt install -y --no-install-recommends \
    plasma-desktop \
    plasma-workspace \
    plasma-nm \
    plasma-pa \
    sddm \
    dolphin \
    konsole \
    kate

log "Setting default target to graphical..."
sudo systemctl set-default graphical.target

log "Setting SDDM as default display manager..."
sudo dpkg-reconfigure sddm

log "Installation complete! Please reboot your system."
log "After reboot, select 'Plasma' at the login screen."
