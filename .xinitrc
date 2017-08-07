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

# Caps Lock as Escape key
setxkbmap -option caps:escape

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Start fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &

# Start ssh-agent
eval $(ssh-agent)

# Start syndaemon to disable touch pad when typing
# -i 1: wait 1 second after the last key press before enabling the touch pad.
# -K: Ignore modifier keys and Modifier+Key combos when monitoring keyboard activity
# -d: Start as a daemon
syndaemon -i 1 -K -d

source ~/.zsh/.env

# Start window manager
session=${1:-i3}
case $session in
  i3                ) exec i3 2>~/.xsession-errors;;
  i3log             ) exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1;;
  xmonad            ) exec xmonad;;
  dwm               ) exec dwm;;
  awesome           ) exec awesome;;
  # No known session, try to run it as command
  *) exec $1;;
esac

