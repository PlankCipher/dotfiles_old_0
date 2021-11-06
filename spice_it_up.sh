#!/bin/sh

SCRIPT_DIR=$(pwd)

setup () {
  sudo pacman -Syu git base-devel make qt5-tools qt5-base gcc wget clang
}

install_yay () {
  sudo git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
  sudo chown -R $(whoami):$(whoami) /opt/yay-git
  cd /opt/yay-git
  makepkg -si
  cd $SCRIPT_DIR
}

install_stuff_for_dwmblocks () {
  # Required to install ttf-unifont
  mkdir -p $HOME/.gnupg
  echo "keyserver hkps://keyserver.ubuntu.com" >> $HOME/.gnupg/gpg.conf

  sudo pacman -S vnstat
  sudo systemctl enable vnstat

  yay -S ttf-unifont noto-fonts-emoji sysstat libqalculate bc bluez-hcitool bluez-utils

  sudo mkdir -p /usr/share/fonts/opentype/
  sudo cp $SCRIPT_DIR/fontawesome/* /usr/share/fonts/opentype/

  sed -i "s/\/home\/testninja/\/home\/$(whoami)/" $SCRIPT_DIR/suckless/dwmblocks/config.def.h
}

install_suckless_stuff () {
  # DWM
  cd $SCRIPT_DIR/suckless/dwm
  sudo make clean install
  cd $SCRIPT_DIR

  # DWMBLOCKS
  install_stuff_for_dwmblocks
  cd $SCRIPT_DIR/suckless/dwmblocks
  sudo make clean install
  cd $SCRIPT_DIR

  # DMENU
  cd $SCRIPT_DIR/suckless/dmenu
  sudo make clean install
  cd $SCRIPT_DIR

  # ST
  cd $SCRIPT_DIR/suckless/st
  sudo make clean install
  cd $SCRIPT_DIR
}

install_et () {
  sudo pacman -S tre sox

  mkdir -p $HOME/Downloads
  git clone https://github.com/PlankCipher/et.git $HOME/Downloads/et
  cd $HOME/Downloads/et
  ./install.sh
  cd $SCRIPT_DIR
  rm -rf $HOME/Downloads/et
}

install_main_ui_dependencies () {
  yay -S xorg xorg-server xorg-xinit xorg-setxkbmap xorg-xmodmap xf86-video-amdgpu xf86-input-libinput xclip

  yay -S picom-ibhagwan-git rofi-greenclip xautolock unclutter brightnessctl pulseaudio alsa alsa-utils pavucontrol dunst libnotify gnome-themes-extra bibata-cursor-theme-bin iw

  sed -i "s/\/home\/testninja/\/home\/$(whoami)/" $SCRIPT_DIR/.config/greenclip.toml

  install_suckless_stuff
  install_et
}

install_neovim () {
  yay -S neovim fzf ripgrep the_silver_searcher fd

  ## Install vim-plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  pip install jedi

  ## Install Hack Nerd Font
  mkdir -p $HOME/Downloads/Compressed/
  curl -Lo $HOME/Downloads/Compressed/hack_nerd_font.zip 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip'
  sudo unzip $HOME/Downloads/Compressed/hack_nerd_font.zip -d /usr/share/fonts/TTF/
  rm -rf $HOME/Downloads/Compressed
}

install_mpd () {
  yay -S mpd mpc ncmpcpp

  # Add mpd to required groups
  sudo gpasswd -a mpd $(whoami)
  chmod 710 $HOME/
  sudo gpasswd -a mpd audio
}

install_ranger () {
  yay -S ranger

  # Install The Great of All Time: Mighty Dragon
  git clone https://github.com/mwh/dragon.git $HOME/Downloads/dragon
  cd $HOME/Downloads/dragon/
  sudo make install
  sudo chmod +x dragon
  sudo mv dragon /sbin/dragon
  cd $SCRIPT_DIR
  rm -rf $HOME/Downloads/dragon

  # Install ranger_devicons plugin
  git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons
}

install_zsh_and_ohmyzsh () {
  yay -S zsh

  # Change default shell to ZSH
  chsh -s /usr/bin/zsh

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

  cp $SCRIPT_DIR/zsh/steeef.zsh-theme $HOME/.oh-my-zsh/themes/steeef.zsh-theme

  # Install zsh-autosuggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Install zsh-syntax-highlighting plugin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # Install python-colorscript
  sudo wget https://raw.githubusercontent.com/stautonico/python-color-scripts/main/python-colorscript -P /usr/bin/ && \
  sudo chmod +x /usr/bin/python-colorscript && \
  sudo mkdir /etc/python-colorscript && \
  sudo wget https://raw.githubusercontent.com/stautonico/python-color-scripts/main/art.json -P /etc/python-colorscript && \
  sudo chmod 666 /etc/python-colorscript/art.json
}

install_dev_stuff () {
  # NodeJS, NPM, and YARN
  sudo pacman -S nodejs npm

  sudo npm config set init-license GPL-3.0-only -g
  sudo npm config set init-author-name PlankCipher -g

  sudo npm install yarn -g
  yarn global add eslint-cli create-react-app

  # Install Heroku CLI
  curl https://cli-assets.heroku.com/install.sh | sh

  # Create main dev directories
  mkdir -p $HOME/chamber_of_magic/junk/ $HOME/chamber_of_magic/test/

  # Other debugging programs
  yay -S insomnia-bin
}

install_other_dependencies () {
  yay -S scrot feh vlc zathura zathura-pdf-mupdf ueberzug brave-bin python-pip python zip unzip bat discord freetube-bin franz-bin telegram-desktop libxft-bgra imagemagick i3lock fuse

  # Thunderbird
  sudo pacman -S thunderbird

  install_neovim
  install_mpd
  install_ranger
  install_zsh_and_ohmyzsh
  install_dev_stuff
}

copy_files_and_create_dirs () {
  cp -r $SCRIPT_DIR/.config $SCRIPT_DIR/.scripts $SCRIPT_DIR/.zprofile $SCRIPT_DIR/.Xresources $SCRIPT_DIR/.xinitrc $SCRIPT_DIR/.icons $HOME/
  mkdir -p $HOME/Downloads/Music
  mkdir -p $HOME/.local/share/zsh
  touch $HOME/.local/share/zsh/history
  sudo cp $SCRIPT_DIR/40-libinput.conf /usr/share/X11/xorg.conf.d/
  sudo cp $SCRIPT_DIR/index.theme /usr/share/icons/default/
}

setup
install_yay
install_main_ui_dependencies
install_other_dependencies
copy_files_and_create_dirs

cat << EOF
__        __   _                               _                          _
\ \      / /__| | ___ ___  _ __ ___   ___     | |__   ___  _ __ ___   ___| |
 \ \ /\ / / _ \ |/ __/ _ \| '_ \` _ \ / _ \    | '_ \ / _ \| '_ \` _ \ / _ \ |
  \ V  V /  __/ | (_| (_) | | | | | |  __/    | | | | (_) | | | | | |  __/_|
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|    |_| |_|\___/|_| |_| |_|\___(_)
EOF
exit 0
