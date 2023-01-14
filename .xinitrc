/etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
$HOME/.scripts/setup_monitors.sh
unclutter &
xinput list --id-only | xargs -I {} sh -c '(xinput list-props {} | grep -q "libinput Middle Emulation Enabled") && xinput set-prop {} "libinput Middle Emulation Enabled" 1'
$HOME/.scripts/random_wallpaper.sh &
qalc -exrates > /dev/null &
xautolock -time 1 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
greenclip clear &
greenclip daemon &
lxsession &
thunderbird &
dunst &
dwmblocks &
picom &
exec dwm
