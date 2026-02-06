#!/usr/bin/env bash

########################################################
#                 ______        ____  __               #
#                |  _ \ \      / /  \/  |              #
#                | | | \ \ /\ / /| |\/| |              #
#                | |_| |\ V  V / | |  | |              #
#                |____/  \_/\_/  |_|  |_|              #
#                                                      #
########################################################
# tom@archway                                          #
########################################################
#                                                      #
########################################################
# Created: 2026-02-04                                  #
########################################################

echo 'Hi, how are you'
echo 'A list of files and directories with sizes: '
while true; do
  # List all the files and directories in current path
  ls -lh

  # Ask the user for input
  read -rp "Please enter a line of text: " line
  if [[ -z "$line" ]]; then
    echo "Goodbye!"
    break
  fi
  echo "Character count: ${#line}"
done
