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
│ [2]  Installation system software                  │ 
│ [3]  Install oh-my-zsh                             │
│ [4]  Build Picom                                   │
│ [5]  .zshrc cp error                               │
│ [6]  Fonts                                         │
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
  source .installation_system_software.sh
  sleep 1
  cd ~/Dotfiles
;;
  

3)
  echo "Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm -r ~/.zshrc
  cp -r .zshrc ~/.zshrc
  echo "installation Complite! run [7]"
  ;;

4)
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

5)
  rm -r ~/.zshrc
  cp -r .zshrc ~/.zshrc
  ;;

6)
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
