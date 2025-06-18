
# turn off Display Power Management Service (DPMS)
xset -dpms
setterm -blank 0 -powerdown 0

# turn off black Screensaver
xset s off

exec dbus-launch --exit-with-session bspwm
xset b off
