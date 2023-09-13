#!/bin/bash

printf "\e[1;37m 
▀█▀ █▄█ █▀▀ █▄ ▄█ █▀▀ █▀▀ █ █ █ ▀█▀ ▀█▀ █▀▀ █▄█ 
 █  █ █ ██▄ █ ▀ █ ██▄ ▄██ ▀▄▀▄▀ ▄█▄  █  █▄▄ █ █  
                           By AXWTV_BugAssassin

┌──────────────────────────────────────────────┐
│ [1]  Catppuccin                              │
│ [2]  Tokyo Night                             │ 
│ [0]  Exit                                    │
└──────────────────────────────────────────────┘
\e[0m"
read -rp ' ❯ Enter option: ' OPTION

case "$OPTION" in

1)
  cp -r .dot-theme/Catppuccin/* ~/.config/
  ;;

2)
  cp -r .dot-theme/Tokyo_Night/* ~/.config/
  ;;

0)
  echo "Exiting"
  ;;

*)
  echo "Invalid command !"
  ;;
esac