#/!bin/bash

echo "starting installation..."

echo "Installing Dependencies {Arch-Only}"
sudo pacman -S i3-gaps polybar alacritty rofi feh brave-browser && yay -S picom-git

echo "Configering Config Files"
mkdir -p ~/.config/i3
mkdir -p ~/.config/polybar
mkdir -p ~/.config/picom
mkdir -p ~/.config/alacritty

cp .config/i3/config ~/.config/i3/config
cp .config/polybar/config.ini ~/.config/polybar/config.ini
cp .config/polybar/launch.sh ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/launch.sh
cp .config/picom/picom.conf ~/.config/picom/picom.conf
cp .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
cp -r .zshrc ~/.zshrc

echo "Cofigering Files Done!"
echo "Font set up"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
wget https://use.fontawesome.com/releases/v6.2.1/fontawesome-free-6.2.1-desktop.zip
mkdir ~/.fonts
cp JetBrainsMono.zip ~/.fonts/
cp fontawesome-free-6.2.1-desktop.zip ~/.fonts/
cd ~/.fonts/
unzip JetBrainsMono.zip 
unzip fontawesome-free-6.2.1-desktop.zip 

echo "Get Awesome Font and JetBrainMono Nerd Font Done!"
echo "installation Complite!"


