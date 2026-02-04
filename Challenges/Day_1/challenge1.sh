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
name="Tosh"
age=25
num1=16
num2=28

# Print a message
echo "Hello World! Your name is $name and you are $age years old"
echo
# This adds two numbers togethe
answer=$((num1 + num2))
echo "The answer to your sum is $answer"
echo
# This showes the name of a user
echo "Your name is $USER"
echo
# Showes the present working dircetory
echo "Your prensent working directory is $PWD"
echo
# Showes editor uesd
echo "Your editor is $EDITOR"
echo
# prints all the pdfs in a dircetory
find "$HOME/Documents/All_Pdf_files/Access" -type f -name "*.pdf"
