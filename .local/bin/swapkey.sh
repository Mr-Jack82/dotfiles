#!/bin/bash

# Wait until GUI loads up
sleep 4s #For KDE autostart

# Increase key speed via a rate change
# idea from LukeSmithxyz
xset r rate 300 50 &

# First of all, you need to swap somehow CapsLock and
# Left_Control. Then that prog do all the stuff.
# In particular when you press and hold Esc (or with
# combinations with other keys) it works like Ctrl.
xcape -e 'Control_L=Escape' &
