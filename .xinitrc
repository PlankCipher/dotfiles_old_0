/etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
$HOME/.scripts/setup_monitors.sh
unclutter &
$HOME/.scripts/random_wallpaper.sh &
qalc -exrates > /dev/null &
xautolock -time 1 -locker "$HOME/.scripts/i3lock_fancy_multimonitor/lock -n -p -g" &
greenclip clear &
greenclip daemon &
setxkbmap -layout us,ara -option grp:win_space_toggle,caps:escape &
sudo dell-g5se-fanctl.py &
thunderbird &
dunst &
dwmblocks &
picom &
exec dwm
