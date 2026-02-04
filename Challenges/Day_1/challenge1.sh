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

# This adds two numbers together
answer=$((num1 + num2))
echo "The answer to your sum is $answer"

# This shows the name of a user
echo "Your name is $USER"

# shows the present working directory
echo "Your prensent working directory is $PWD"

# Shows editor used
echo "Your editor is $EDITOR"
echo
# prints all the PDFs in a directory
ls "$HOME"/Documents/All_Pdf_files/Access/*.pdf
