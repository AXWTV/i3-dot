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
┌──────────────────────────────────────┐
│ [1]  Backup                          │
│ [2]  Restore error                   │
│ [3]  Installation deb system .file   │ 
│ [4]  Installation arch syatem .file  │
│ [5]  Installation redhat system .file│
│ [6]  Install oh-my-zsh               │
│ [7]  .zshrc cp error                 │ 
│ [0]  Exit                            │
└──────────────────────────────────────┘
\e[0m"
read -rp ' ❯ Enter option: ' OPTION

case "$OPTION" in

1)
	rm -r .config/alacritty
	rm -r .config/polybar
	rm -r .config/i3
	rm -r .config/picom
	rm -r .zshrc
	rm -r .config/neofetch
  rm -r .confin/nvim
  rm -r .config/rofi
	rm -r .config/nitrogen

	cp -r ~/.config/alacritty .config/alacritty
	cp -r ~/.config/nvim .config/nvim
  cp -r ~/.config/polybar .config/polybar
	cp -r ~/.config/i3 .config/i3
	cp -r ~/.config/picom .config/picom
	cp -r ~/.config/neofetch .config/neofetch
	cp -r ~/.zshrc .zshrc
  cp -r ~/color color
  cp -r ~/.config/rofi .config/rofi
  cp -r ~/.config/nitrogen .config/nitrogen

	git add .
	git commit -m "backup"
	git push
	;;
2)
	rm -r ~/.config/alacritty
	rm -r ~/.config/polybar
	rm -r ~/.config/i3
	rm -r ~/.config/picom
	rm -r ~/.config/neofetch
  rm -r ~/.config/nvim
	rm -r ~/.zshrc

  mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
  mkdir -p ~/.config/nvim
	mkdir -p ~/.config/neofetch
  mkdir -p ~/.config/rofi
  mkdir -p ~/.config/nitrogen
  mkdir -p ~/.config/wallpaper

	cp -r .config/i3 ~/.config/i3
  cp -r .config/nvim ~/.config/nvim
	cp -r .config/polybar ~/.config/polybar
	cp -r .config/picom ~/.config/picom
	cp -r .config/alacritty ~/.config/alacritty
  cp -r color ~/color
  cp -r .config/rofi ~/.config/rofi
	cp -r .config/neofetch ~/.config/neofetch
  cp -r .config/nitrogen ~/.config/nitrogen
	;;
3)
	echo "starting installation..."
	cd
	sudo apt update

	echo "Installing Dependencies {Deb-Only}"
	sudo apt install -y i3-gaps polybar alacritty rofi dunst feh snapd nitrogen vim neofetch neovim
	sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
	sudo apt install -y cmake meson pkg-config asciidoc curl neofetch nvim vim

	echo "picom building"
	git clone https://github.com/yshui/picom.git
	cd picom
	git submodule update --init --recursive
	meson setup --buildtype=release . build
	ninja -C build
	sudo ninja -C build install
	cd ..

	echo "Configering Confg Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
  mkdir -p ~/.config/nvim
	mkdir -p ~/.config/neofetch
  mkdir -p ~/.config/rofi
  mkdir -p ~/.config/nitrogen
  mkdir -p ~/.config/wallpaper

	cd ~/Dotfiles

	cp -r .config/i3 ~/.config/i3
  cp -r .config/nvim ~/.config/nvim
	cp -r .config/polybar ~/.config/polybar
	cp -r .config/picom ~/.config/picom
	cp -r .config/alacritty ~/.config/alacritty
  cp -r color ~/color
  cp -r .config/rofi ~/.config/rofi
	cp -r .config/neofetch ~/.config/neofetch
  cp -r .config/nitrogen ~/.config/nitrogen

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	git clone https://github.com/AXWTV/AXWTV_AniWall.git ~/.config/wallpaper

	echo "Font set up"
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
4)
	echo "starting installation..."
	cd

	echo "Installing Dependencies {Arch-Only}"
	sudo pacman -S i3-gaps polybar alacritty nitrogen dunst neofetch rofi feh vim neovim && yay -S picom-git

  echo "Configering Confg Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
  mkdir -p ~/.config/nvim
	mkdir -p ~/.config/neofetch
  mkdir -p ~/.config/rofi
  mkdir -p ~/.config/nitrogen
  mkdir -p ~/.config/wallpaper

	cd ~/Dotfiles

	cp -r .config/i3 ~/.config/i3
  cp -r .config/nvim ~/.config/nvim
	cp -r .config/polybar ~/.config/polybar
	cp -r .config/picom ~/.config/picom
	cp -r .config/alacritty ~/.config/alacritty
  cp -r color ~/color
  cp -r .config/rofi ~/.config/rofi
	cp -r .config/neofetch ~/.config/neofetch
  cp -r .config/nitrogen ~/.config/nitrogen

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	git clone https://github.com/AXWTV/AXWTV_AniWall.git ~/.config/wallpaper

	echo "Font set up"
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
	echo "installation Complite!"
	;;
5)	echo "Starting installation..."
	cd

	echo "Installing Dependencies {Red_Hat-Only}"
  sudo dnf copr enable atim/bottom -y
  sudo dnf install -y i3-gaps polybar bottom dunst alacritty neofetch rofi feh vim nitrogen neovim
	sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel asciidoc

	echo "picom building"
	git clone https://github.com/yshui/picom.git
	cd picom
	git submodule update --init --recursive
	meson setup --buildtype=release . build
	ninja -C build
	sudo ninja -C build install
	cd ..

	echo "Configering Confg Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
  mkdir -p ~/.config/nvim
	mkdir -p ~/.config/neofetch
  mkdir -p ~/.config/rofi
  mkdir -p ~/.config/nitrogen
  mkdir -p ~/.config/wallpaper

	cd ~/Dotfiles

	cp -r .config/i3 ~/.config/i3
  cp -r .config/nvim ~/.config/nvim
	cp -r .config/polybar ~/.config/polybar
	cp -r .config/picom ~/.config/picom
	cp -r .config/alacritty ~/.config/alacritty
  cp -r color ~/color
  cp -r .config/rofi ~/.config/rofi
	cp -r .config/neofetch ~/.config/neofetch
  cp -r .config/nitrogen ~/.config/nitrogen

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	git clone https://github.com/AXWTV/AXWTV_AniWall.git ~/.config/wallpaper
	
  echo "Font set up"
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
	echo "installation Complite!"

	;;
6)
	echo "Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "installation Complite! run [6]"
	;;
7)
  rm -r ~/.zshrc
	cp -r .zshrc ~/.zshrc
	;;
0)
	echo "Exiting"
	;;
*)
	echo "Invalid command !"
	;;
esac
