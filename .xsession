#!/bin/sh
# Set X server resources.
xrdb $HOME/.config/Xresources/Xresources &
# Set screen resolution and refresh rate.
xrandr -s 1920x1080 -r 144 &
# Disable screensaver.
xset s off &
# Disable DPMS (Energy Star) features.
xset -dpms &
# Hide mouse cursor when inactive.
unclutter-xfixes --timeout 1 &
# Run window manager.
exec xmonad
