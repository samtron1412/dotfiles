#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# Start redshift-gtk
redshift-gtk &

# Start fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &

# Kill all ssh-agent before start new one
killall -q ssh-agent
eval $(ssh-agent)

# If want to use x11-ssh-askpass
# export SSH_ASKPASS=x11-ssh-askpass

# Start syndaemon to disable touch pad when typing
# -i 2: wait 1 second after the last key press before enabling the touch pad.
# -t: Only disable tapping and scrolling, not mouse movements
# -K: Ignore modifier keys and Modifier+Key combos when monitoring keyboard activity
# -d: Start as a daemon
syndaemon -i 2 -t -K -d

# start window manager
session=${1:-i3}
case $session in
# i3                ) exec i3 -V >> ~/.i3/i3log 2>&1;;
  i3                ) exec i3;;
  xmonad            ) exec xmonad;;
  dwm               ) exec dwm;;
  awesome           ) exec awesome;;
  # No known session, try to run it as command
  *) exec $1;;
esac
