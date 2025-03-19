# KDE Plasma 6 Installation for Ubuntu 24.04

Scripts to install the latest KDE Plasma 6 on Ubuntu 24.04 LTS (Noble Numbat).

## Quick Installation (Fresh Ubuntu 24.04 Server)

```bash
# 1. Clone the repository
git clone https://github.com/MagicUnicornInc/kde-plasma6-install.git

# 2. Change to the repository directory
cd kde-plasma6-install

# 3. Run the installation script
sudo ./scripts/install_plasma6.sh

# 4. Reboot your system
sudo reboot
```

After reboot, select 'Plasma' at the login screen to ensure you're using Plasma 6.

## What's Included

- Latest KDE Plasma 6 desktop environment
- Essential KDE applications:
  - Dolphin (file manager)
  - Konsole (terminal)
  - Kate (text editor)
- Network and audio management
- SDDM display manager

## Verification

To verify you have Plasma 6 installed, run:
```bash
plasmashell --version
```

This should show version 6.x.x

## Requirements

- Ubuntu 24.04 LTS Server
- Internet connection
- 20GB free disk space
- 4GB RAM minimum (8GB recommended)

## Support

If you encounter any issues, please:
1. Check the [Installation Guide](docs/kde_plasma6_install_guide.md)
2. Visit [GitHub Issues](https://github.com/MagicUnicornInc/kde-plasma6-install/issues)

## License

MIT License - Feel free to modify and distribute.
