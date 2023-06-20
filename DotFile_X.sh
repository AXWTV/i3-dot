#!/bin/bash

printf "\e[1;34m 
▓█████▄  ▒█████  ▄▄▄█████▓  █████▒██▓ ██▓    ▓█████   ██████     █    ██ ▄▄▄█████▓ ██▓ ██▓     ██▓▄▄▄█████▓ ██▓▓█████   ██████ 
▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓██   ▒▓██▒▓██▒    ▓█   ▀ ▒██    ▒     ██  ▓██▒▓  ██▒ ▓▒▓██▒▓██▒    ▓██▒▓  ██▒ ▓▒▓██▒▓█   ▀ ▒██    ▒ 
░██   █▌▒██░  ██▒▒ ▓██░ ▒░▒████ ░▒██▒▒██░    ▒███   ░ ▓██▄      ▓██  ▒██░▒ ▓██░ ▒░▒██▒▒██░    ▒██▒▒ ▓██░ ▒░▒██▒▒███   ░ ▓██▄   
░▓█▄   ▌▒██   ██░░ ▓██▓ ░ ░▓█▒  ░░██░▒██░    ▒▓█  ▄   ▒   ██▒   ▓▓█  ░██░░ ▓██▓ ░ ░██░▒██░    ░██░░ ▓██▓ ░ ░██░▒▓█  ▄   ▒   ██▒
░▒████▓ ░ ████▓▒░  ▒██▒ ░ ░▒█░   ░██░░██████▒░▒████▒▒██████▒▒   ▒▒█████▓   ▒██▒ ░ ░██░░██████▒░██░  ▒██▒ ░ ░██░░▒████▒▒██████▒▒
 ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░    ▒ ░   ░▓  ░ ▒░▓  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░   ░▒▓▒ ▒ ▒   ▒ ░░   ░▓  ░ ▒░▓  ░░▓    ▒ ░░   ░▓  ░░ ▒░ ░▒ ▒▓▒ ▒ ░
  ░ ▒  ▒   ░ ▒ ▒░     ░     ░      ▒ ░░ ░ ▒  ░ ░ ░  ░░ ░▒  ░ ░   ░░▒░ ░ ░     ░     ▒ ░░ ░ ▒  ░ ▒ ░    ░     ▒ ░ ░ ░  ░░ ░▒  ░ ░
   ░ ░  ░ ░ ░ ░ ▒    ░       ░ ░    ▒ ░  ░ ░      ░   ░  ░  ░      ░░░ ░ ░   ░       ▒ ░  ░ ░    ▒ ░  ░       ▒ ░   ░   ░  ░  ░  
      ░        ░ ░                   ░      ░  ░   ░  ░      ░        ░               ░      ░  ░ ░            ░     ░  ░      ░  
       ░                                                                                                                             
┌────────────────────────────────────────────────────┐
│ [1]  .Config Files                                 │
│ [2]  Installation Debian system software           │ 
│ [3]  Installation Arch syatem software             │
│ [4]  Installation RHEL/Fedora system software      │
│ [5]  Install oh-my-zsh                             │
│ [6]  Build Picom                                   │
│ [7]  .zshrc cp error                               │
│ [8]  Fonts                                         │
│ [0]  Exit                                          │
└────────────────────────────────────────────────────┘
\e[0m"
read -rp ' ❯ Enter option: ' OPTION

case "$OPTION" in

1)
  cd
  echo "Configering Confg Files"
  mkdir -p ~/.config/i3
  mkdir -p ~/.config/polybar
  mkdir -p ~/.config/picom
  mkdir -p ~/.config/alacritty
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/neofetch
  mkdir -p ~/.config/rofi
  mkdir -p ~/.config/nitrogen
  mkdir -p ~/.config/dunst

  cd ~/Dotfiles
  
  cp -r .config/i3 ~/.config/
  cp -r .config/nvim ~/.config/
  cp -r .config/polybar ~/.config/
  cp -r .config/picom ~/.config/
  cp -r .config/alacritty ~/.config/
  cp -r .zshrc ~/.zshrc
  cp -r color ~/color
  cp -r .config/rofi ~/.config/
  cp -r .config/neofetch ~/.config/
  cp -r .config/dunst ~/.config/
  
  echo "Cofigering Files Done!"
  ;;

2)
  echo "starting installation..."
  cd
  sudo apt update
  echo "Installing Dependencies {Debian-Only}"
  sudo apt install -y i3-gaps polybar alacritty rofi vim dunst neovim feh snapd zsh btop
  sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
  sudo apt install -y cmake meson pkg-config asciidoc curl neofetch
  
  git clone https://github.com/catppuccin/rofi.git
  cd rofi/basic
  ./install
  
  cd ~/Dotfiles

  echo "Done!"
  ;;

3)
  echo "starting installation..."
  cd
  echo "Installing Dependencies {Arch-Only}"
  sudo pacman -S i3-gaps polybar alacritty neofetch rofi btop dunst zsh feh curl vim nvim && yay -S picom-git

  git clone https://github.com/catppuccin/rofi.git
  cd rofi/basic
  ./install
  
  cd ~/Dotfiles

  echo "Done!"
  ;;

4)
  echo "Starting installation..."
  cd
  echo "Installing Dependencies {RHEL-Only}"
  sudo dnf install -y i3-gaps polybar btop dunst alacritty neofetch neovim vim rofi feh nitrogen zsh
  sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel asciidoc curl cmake

  git clone https://github.com/catppuccin/rofi.git
  cd rofi/basic
  ./install
  
  cd ~/Dotfiles

  echo "Done!"
  ;;

5)
  echo "Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "installation Complite! run [7]"
  ;;

6)
  cd
 
  echo "picom building"
  git clone https://github.com/yshui/picom.git
  cd picom
  git submodule update --init --recursive
  meson setup --buildtype=release . build
  ninja -C build
  sudo ninja -C build install
  cd ~/Dotfiles
  ;;

7)
  rm -r ~/.zshrc
  cp -r .zshrc ~/.zshrc
  ;;

8)
  echo "fonts"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
  wget https://use.fontawesome.com/releases/v6.2.1/fontawesome-free-6.2.1-desktop.zip

  mkdir ~/.fonts
  cp JetBrainsMono.zip ~/.fonts/
  cp fontawesome-free-6.2.1-desktop.zip ~/.fonts/
  cd ~/.fonts/
  unzip JetBrainsMono.zip 
  unzip fontawesome-free-6.2.1-desktop.zip 
  cd ~/Dotfiles

  echo "Get Awesome Font and JetBrainMono Nerd Font Done!"
  ;;

0)
  echo "Exiting"
  ;;

*)
  echo "Invalid command !"
  ;;
esac
