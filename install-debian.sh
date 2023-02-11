#/!bin/bash

echo "starting installation..."

sudo apt update

echo "Installing Dependencies {Deb-Only}"
sudo apt install -y i3-gaps polybar alacritty rofi feh snapd
sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
sudo apt install -y cmake ninja-build

echo "picom building"
git clone https://github.com/yshui/picom.git
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
ninja -C build install
cd ..

echo "Configering Config Files"
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

echo "Get Awesome Font and JetBrainMono Nerd Font Done!"
echo "installation Complite!"

