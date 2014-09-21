#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# add non-native resolution and automatically output to this resolution
xrandr --newmode "1536x864_60.00"  109.25  1536 1624 1784 2032  864 867 872 897 -hsync +vsync
xrandr --addmode eDP1 1536x864_60.00
xrandr --output eDP1 --mode 1536x864_60.00

# Start authentication for GUI apps that need it
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Guake
sleep 3 && guake &

# load X environment
# exec gnome-session
# exec startkde
# exec dbus-launch i3
exec startxfce4
