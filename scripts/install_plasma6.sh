#!/bin/bash
set -e

# Function to print messages with timestamps
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# Function to check if running as root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        log "Please run as root or with sudo"
        exit 1
    fi
}

# Function to check system requirements
check_requirements() {
    log "Checking system requirements..."
    
    # Check Ubuntu version
    if ! grep -q "Ubuntu 24.04" /etc/os-release; then
        log "Warning: This script is designed for Ubuntu 24.04"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    # Check available disk space (20GB minimum)
    available_space=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
    if [ "$available_space" -lt 20 ]; then
        log "Warning: Less than 20GB of free space available"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
    
    # Check RAM (4GB minimum)
    total_ram=$(free -g | awk '/^Mem:/{print $2}')
    if [ "$total_ram" -lt 4 ]; then
        log "Warning: Less than 4GB of RAM detected"
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Function to backup important configurations
backup_configs() {
    log "Creating backup of important configurations..."
    backup_dir="/root/plasma6_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    # Backup important configuration files
    if [ -f /etc/default/grub ]; then
        cp /etc/default/grub "$backup_dir/"
    fi
    if [ -f /etc/X11/xorg.conf ]; then
        cp /etc/X11/xorg.conf "$backup_dir/"
    fi
    
    log "Backup created in $backup_dir"
}

# Main installation function
install_plasma6() {
    log "Starting KDE Plasma 6 installation..."
    
    # Update package lists
    log "Updating package lists..."
    apt update
    
    # Upgrade existing packages
    log "Upgrading existing packages..."
    apt upgrade -y
    
    # Install HWE kernel
    log "Installing HWE kernel..."
    apt install --install-recommends linux-generic-hwe-24.04 -y
    
    # Install minimal Kubuntu desktop
    log "Installing Kubuntu desktop (minimal installation)..."
    apt install --no-install-recommends kubuntu-desktop -y
    
    # Set default target to graphical
    log "Setting default target to graphical..."
    systemctl set-default graphical.target
    
    # Basic KDE applications (optional)
    log "Installing basic KDE applications..."
    apt install --no-install-recommends \
        konsole \
        dolphin \
        kate \
        -y
    
    log "Installation completed successfully!"
    log "Please reboot your system to start using KDE Plasma 6"
    log "After reboot, log in to the Plasma desktop environment"
}

# Cleanup function
cleanup() {
    log "Cleaning up..."
    apt autoremove -y
    apt clean
}

# Main script execution
main() {
    log "Starting KDE Plasma 6 installation script..."
    
    check_root
    check_requirements
    backup_configs
    install_plasma6
    cleanup
    
    log "Installation process completed!"
    log "Please reboot your system now with: sudo reboot"
}

# Run main function
main

