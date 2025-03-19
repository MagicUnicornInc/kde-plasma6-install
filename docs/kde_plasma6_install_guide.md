# KDE Plasma 6 Installation Guide

This guide provides detailed instructions for installing KDE Plasma 6 on Ubuntu 24.04 LTS (Noble Numbat), both for existing systems and fresh installations.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Quick Installation](#quick-installation)
3. [Fresh Ubuntu Server Installation](#fresh-ubuntu-server-installation)
4. [Post-Installation Steps](#post-installation-steps)
5. [Troubleshooting](#troubleshooting)

## Prerequisites

- Ubuntu 24.04 LTS (Noble Numbat)
- Sudo privileges
- Internet connection
- At least 20GB of free disk space
- 4GB RAM minimum (8GB recommended)

## Quick Installation

### Option 1: Using the Installation Script

1. Save the following script as `install_plasma6.sh`:
```bash
#!/bin/bash
set -e

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing the HWE kernel for Ubuntu 24.04..."
sudo apt install --install-recommends linux-generic-hwe-24.04 -y

echo "Installing Kubuntu desktop (minimal Plasma 6 environment)..."
sudo apt install --no-install-recommends kubuntu-desktop -y

echo "Setting graphical target as default..."
sudo systemctl set-default graphical.target

echo "Installation complete! Please reboot your machine manually to start Plasma 6."
```

2. Make the script executable:
```bash
chmod +x install_plasma6.sh
```

3. Run the script:
```bash
./install_plasma6.sh
```

4. After completion, reboot your system:
```bash
sudo reboot
```

### Option 2: Manual Installation

If you prefer to install step by step:

1. Update your system:
```bash
sudo apt update && sudo apt upgrade -y
```

2. Install the HWE kernel:
```bash
sudo apt install --install-recommends linux-generic-hwe-24.04 -y
```

3. Install the minimal Kubuntu desktop:
```bash
sudo apt install --no-install-recommends kubuntu-desktop -y
```

4. Set the default target to graphical:
```bash
sudo systemctl set-default graphical.target
```

5. Reboot your system:
```bash
sudo reboot
```

## Fresh Ubuntu Server Installation

### Step 1: Download Ubuntu Server 24.04.2 HWE

1. Visit the official Ubuntu website: https://ubuntu.com/download/server
2. Download Ubuntu Server 24.04.2 LTS
3. Verify the ISO checksum (recommended)

### Step 2: Create Bootable USB

Using Etcher or similar tool:
1. Download and install Etcher
2. Select the Ubuntu Server ISO
3. Select your USB drive
4. Flash the image

### Step 3: Install Ubuntu Server

1. Boot from the USB drive
2. Select "Install Ubuntu Server"
3. Choose your language and keyboard layout
4. Configure network (DHCP or manual)
5. Configure storage (use guided partitioning for simplicity)
6. Create your user account
7. Complete the installation and reboot

### Step 4: Post-Installation Setup

After first boot:

1. Log in to your new server
2. Update the system:
```bash
sudo apt update && sudo apt upgrade -y
```

3. Save the installation script:
```bash
wget -O install_plasma6.sh https://raw.githubusercontent.com/yourusername/kde-plasma6-install/main/install_plasma6.sh
# or create it manually as shown in the Quick Installation section
```

4. Make it executable and run:
```bash
chmod +x install_plasma6.sh
./install_plasma6.sh
```

## Post-Installation Steps

After installing KDE Plasma 6 and rebooting:

1. Log in to the Plasma desktop
2. Configure your display settings
3. Set up your preferred applications
4. Configure system settings as needed

### Optional: Install Additional Software

Popular KDE applications:
```bash
sudo apt install --no-install-recommends \
    kate \
    konsole \
    dolphin \
    gwenview \
    okular \
    -y
```

## Troubleshooting

### Common Issues

1. **Black Screen After Installation**
   - Try switching to a terminal with Ctrl+Alt+F2
   - Check X server logs: `sudo cat /var/log/Xorg.0.log`
   - Verify graphics drivers are installed

2. **Login Loop**
   - Check ~/.xsession-errors
   - Verify permissions: `ls -la ~/.Xauthority`
   - Reset KDE configuration if needed

3. **Missing Applications**
   - Install additional packages as needed
   - Use discover (GUI) or apt (CLI) to install software

### Command Reference

Check KDE Plasma version:
```bash
plasmashell --version
```

Check installed packages:
```bash
dpkg -l | grep plasma
```

Reset KDE configuration:
```bash
mv ~/.config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc.bak
```

## Support and Resources

- KDE Community Forums: https://forum.kde.org/
- KDE Documentation: https://docs.kde.org/
- Ubuntu Documentation: https://help.ubuntu.com/
- Kubuntu Documentation: https://kubuntu.org/support/

---

This guide is maintained as part of the CognitiveCompanion project. For updates and more information, visit our repository.

