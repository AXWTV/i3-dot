#!/bin/bash

printf "\e[1;35m 
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
│ [7]  PowerLevel10K | zsh-syntax-highlighting       │
│ [8]  Build EWW                                     │
│ [0]  Exit                                          │
└────────────────────────────────────────────────────┘
\e[0m"
read -rp ' ❯ Enter option: ' OPTION

case "$OPTION" in

1)
  echo "##################################"
  echo "#    Configering Confg Files     #"
  echo "##################################"

  mkdir -p ~/.config/
  mkdir -p ~/.local/bin/

  cp -r .config/* ~/.config/
  cp -r bin/* ~/.local/bin/

  echo "##################################"
  echo "#     Cofigering Files Done!     #"
  echo "##################################"
  ;;

2)
  source .installation_system_software.sh
  echo "###################"
  echo "#    Complete     #"
  echo "###################"
  ;;
  
3)
  echo "###############"
  echo "#  Oh-My-Zsh  #"
  echo "###############"
  cd
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  rm -r ~/.zshrc
  cp -r .zshrc ~/.zshrc

  echo "################################"
  echo "#    installation Complete!    #"
  echo "################################"
  ;;

4)
  cd
  echo "##################"
  echo "# picom building #"
  echo "##################"
  git clone https://github.com/yshui/picom.git
  cd picom
  git submodule update --init --recursive
  meson setup --buildtype=release . build
  ninja -C build
  sudo ninja -C build install
  echo "###################"
  echo "#    Complete     #"
  echo "###################"
  ;;

5)
  rm -r ~/.zshrc
  rm -r ~/.p10k.zsh
  cp -r .zshrc ~/.zshrc
  cp -r .p10k.zsh ~/.p10k.zsh
  echo "###################"
  echo "#    Complete     #"
  echo "###################"
  ;;

6)
  echo "#######################"
  echo "#        Fonts        #"
  echo "#######################"
  mkdir -p ~/.fonts/
  mkdir -p ~/.local/share/fonts
  cd ~/.fonts/
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/NerdFontsSymbolsOnly.zip
  wget https://use.fontawesome.com/releases/v6.4.0/fontawesome-free-6.4.0-desktop.zip
  unzip fontawesome-free-6.4.0-desktop.zip -d ~/.local/share/fonts
  unzip Hack.zip -d ~/.local/share/fonts
  unzip Iosevka.zip -d ~/.local/share/fonts
  unzip JetBrainsMono.zip -d ~/.local/share/fonts
  unzip NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts

  echo "###################################################" 
  echo "#Get Awesome Font and JetBrainMono Nerd Font Done!#"
  echo "###################################################"
  ;;

7)
  echo "###############################################"
  echo "#  PowerLevel10K and zsh-syntax-highlighting  #"
  echo "###############################################"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  cp -r .p10k.zsh ~/.p10k.zsh
  echo "###################"
  echo "#    Complete     #"
  echo "###################"
  ;;

8)
  cd
  rustup default nightly-2020-07-27
  git clone --depth 1 https://github.com/elkowar/eww.git
  cd eww
  cargo build --release --no-default-features --features x11
  cd target/release
  chmod +x eww
  sudo ln -s $(pwd)/eww /usr/local/bin
  ;;

0)
  echo "Exiting"
  ;;

*)
  echo "Invalid command !"
  ;;
esac
