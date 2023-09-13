#!/bin/bash

# Check the Linux distribution
if [ -f /etc/os-release ]; then
    # Read the distribution information
    . /etc/os-release
    #DISTRO=$NAME
    DISTRO=$ID
elif [ -f /etc/os-release ]; then
    # Read the distribution information
    #. /etc/lsb-release
    . /etc/os-release
    #DISTRO=$DISTRIB_ID
    DISTRO=$ID_LIKE
else
    echo "Unknown Linux distribution"
    exit 1
fi

# Run commands based on the distribution
if [ "$DISTRO" == "debian" ] || [ "$DISTRO" == "ubuntu" ]; then
    # Commands for Ubuntu
    # Add your Ubuntu-specific commands here
    echo "starting installation..."
    cd
    #installing and updating softwares
    sudo apt update
    echo "Installing Dependencies {Debian-Only}"
    sudo apt install -y i3-gaps polybar alacritty rofi vim dunst neovim feh snapd zsh btop lsd pavucontrol thunar ranger bluez* blueman gtk2-engines-murrine
    sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev gtk3-devel gdk-pixbuf2-devel cairo-devel glib2-devel glibc-devel pango-devel
    sudo apt install -y cmake meson pkg-config asciidoc curl neofetch 
    # flatpack flathub
    sudo dnf install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    #zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install
    # Cargo and rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    #zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install
    #cloning rofi theme
    git clone https://github.com/adi1090x/rofi.git
    cd rofi
    chmod +x setup.sh
    ./setup.sh
    
    cd ~/Dotfiles

    echo "Done!"

elif [ "$DISTRO" == "fedora" ]; then
    # Commands for Fedora
    echo "Running commands for Fedora"
    # Add your Fedora-specific commands here
    echo "Starting installation..."
    cd
    #installing software
    echo "Installing Dependencies {RHEL-Only}"
    sudo dnf install -y i3-gaps polybar btop dunst alacritty neofetch neovim vim rofi feh nitrogen zsh lsd pavucontrol thunar ranger bluez bluez-tools blueman gtk-murrine-engine

    sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-devel xcb-util-renderutil-devel xorg-x11-proto-devel asciidoc curl cmake gtk3-devel gdk-pixbuf2-devel cairo-devel glib2-devel glibc-devel pango-devel
    # flatpack flathub
    sudo dnf install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    #zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install
    # Cargo and rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    #zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install
    # cloning rofi theme
    git clone https://github.com/adi1090x/rofi.git
    cd rofi
    chmod +x setup.sh
    ./setup.sh
    
    cd ~/Dotfiles
    echo "Done!"

elif [ "$DISTRO" == "arch" ]; then
    # Commands for Arch
    echo "Running commands for Arch"
    # Add your Arch-specific commands here
    echo "starting installation..."
    cd
    #installing softwares
    echo "Installing Dependencies {Arch-Only}"
    sudo pacman -S i3-gaps polybar alacritty neofetch rofi btop pavucontrol dunst zsh lsd feh curl vim nvim thunar ranger bluez bluez-utils blueman gtk-engine-murrine && yay -S picom-git eww
    # flatpack flathub
    sudo dnf install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    #zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install
    #cloning rofi theme
    git clone https://github.com/adi1090x/rofi.git
    cd rofi
    chmod +x setup.sh
    ./setup.sh
    
    cd ~/Dotfiles
    echo "Done!"

else
    # Commands for other distributions
    echo "Not yet supported " $DISTRO
    # Add your commands for other distributions here

fi
