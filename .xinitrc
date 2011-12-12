#!/bin/bash

syndaemon -d
# sleep 3 && setxkbmap dvorak &
sleep 3 && synergys &
xscreensaver -nosplash &
startxfce4
