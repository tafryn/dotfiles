#!/bin/bash

xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'

#feh --bg-scale ~/.wallpaper

syndaemon -d
#xscreensaver -nosplash &
i3
