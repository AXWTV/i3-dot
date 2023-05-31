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
│ [2]  Restore                         │
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
	rm -r .wallpaper
	
	cp -r ~/.config/alacritty/ .config/alacritty
	cp -r ~/.config/polybar/ .config/polybar
	cp -r ~/.config/i3/ .config/i3
	cp -r ~/.config/picom/ .config/picom
	cp -r ~/.config/neofetch .config/neofetch
	cp -r ~/.zshrc .zshrc
	cp -r ~/.wallpaper .wallpaper

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
	rm -r ~/.zshrc
	rm -r ~/.wallpaper

	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/neofetch

	cp .config/i3/config ~/.config/i3/config
	cp .config/polybar/config.ini ~/.config/polybar/config.ini
	cp .config/polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/launch.sh
	cp .config/picom/picom.conf ~/.config/picom/picom.conf
	cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	cp -r .zshrc ~/.zshrc
	cp .config/neofetch/config.conf ~/.config/neofetch/config.conf
	cp -r .wallpaper ~/.wallpaper
	;;
3)
	echo "starting installation..."
	cd
	sudo apt update

	echo "Installing Dependencies {Deb-Only}"
	sudo apt install -y i3-gaps polybar alacritty rofi feh snapd
	sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
	sudo apt install -y cmake meson pkg-config asciidoc curl neofetch

	echo "picom building"
	git clone https://github.com/yshui/picom.git
	cd picom
	git submodule update --init --recursive
	meson setup --buildtype=release . build
	ninja -C build
	sudo ninja -C build install
	cd ..

	echo "Configering Config Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/neofetch

	cd ~/Dotfiles

	cp .config/i3/config ~/.config/i3/config
	cp .config/polybar/config.ini ~/.config/polybar/config.ini
	cp .config/polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/launch.sh
	cp .config/picom/picom.conf ~/.config/picom/picom.conf
	cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	cp -r .zshrc ~/.zshrc
	cp .config/neofetch/config.conf ~/.config/neofetch/config.conf

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	cp -r .wallpaper ~/.wallpaper

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
	sudo pacman -S i3-gaps polybar alacritty neofetch rofi feh brave-browser && yay -S picom-git

	echo "Configering Config Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/neofetch

	cd ~/Dotfiles

	cp .config/i3/config ~/.config/i3/config
	cp .config/polybar/config.ini ~/.config/polybar/config.ini
	cp .config/polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/launch.sh
	cp .config/picom/picom.conf ~/.config/picom/picom.conf
	cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	cp -r .zshrc ~/.zshrc
	cp .config/neofetch/config.conf ~/.config/neofetch/config.conf

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	cp -r .wallpaper ~/.wallpaper

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
	sudo dnf install i3-gaps polybar alacritty neofetch cpufetch rofi feh
	
	echo "Configering Confg Files"
	mkdir -p ~/.config/i3
	mkdir -p ~/.config/polybar
	mkdir -p ~/.config/picom
	mkdir -p ~/.config/alacritty
	mkdir -p ~/.config/neofetch

	cd ~/Dotfiles

	cp .config/i3/config ~/.config/i3/config
	cp .config/polybar/config.ini ~/.config/polybar/config.ini
	cp .config/polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/launch.sh
	cp .config/picom/picom.conf ~/.config/picom/picom.conf
	cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
	cp -r .zshrc ~/.zshrc
	cp .config/neofetch/config.conf ~/.config/neofetch/config.conf

	echo "Cofigering Files Done!"

	echo "wallpaper set up"
	cp -r .wallpaper ~/.wallpaper

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
	cp -r ~/.zshrc .zshrc
	;;
0)
	echo "Exiting"
	;;
*)
	echo "Invalid command !"
	;;
esac
