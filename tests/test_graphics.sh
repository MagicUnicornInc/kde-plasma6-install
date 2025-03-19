#!/bin/bash
# Test graphics capabilities

# Check for GPU
if ! lspci | grep -i "vga\|3d\|2d" > /dev/null; then
    echo "ERROR: No graphics adapter found"
    exit 1
fi

# Check for X.org or Wayland support
if ! dpkg -l | grep -E "xserver-xorg|wayland" > /dev/null; then
    echo "WARNING: Neither X.org nor Wayland found"
fi

# Check for OpenGL support
if ! glxinfo 2>/dev/null | grep "direct rendering" | grep "Yes" > /dev/null; then
    echo "WARNING: No OpenGL acceleration detected"
fi

echo "Graphics tests completed!"
exit 0
