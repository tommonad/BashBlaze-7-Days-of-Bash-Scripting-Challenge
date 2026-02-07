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
# Created: 2026-02-06                                  #
########################################################
# Explain usage
display_usage() {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo -e "\t-c,  --create   Create a new user account"
  echo -e "\t-d,  --delete   Delete a user account"
  echo -e "\t-r,  --reset    Reset password for an existing user account"
  echo -e "\t-l,  --list     List all user accounts on the system"
  echo -e "\t-h,  --help     Show help and exit"
  exit 0
}

# Create user
create_user() {
  read -rp "Please enter your name to create an account: " name
  if id "$name" &>/dev/null; then
    echo "ERROR: This user exists"
  else
    read -rsp "Enter a password for $name: " password
    sudo useradd -m -p "$password" "$name"
    echo "User account for $name created successfully"
  fi
}

# Delete user
delete_user() {
  read -rp "Please enter name of user account to delete: " username
  if id "$username" &>/dev/null; then
    sudo userdel -r "$username" # -r deletes the home directory for the user
    echo "$name user account deleted successfully"
  else
    echo "ERROR: The user $username doesn't exist"
  fi
}
# Reset password
reset_pass() {
  read -rp "Please give user name: " username
  if id "$username" &>/dev/null; then
    read -rsp "Enter the new password for $username: " password
    # Set the new password
    echo "$username:$password" | sudo chpasswd
    echo "Password for user $username reset successfully."
  else
    echo "Error: The username $username does not exist. Please enter valid username."
  fi
}
# List users
list_users() {
  echo "User accounts on the system:"
  cat /etc/passwd | awk -F ':' '{ print "- " $1 " (UID: " $3 ")" }'
}

# Check if no arguments are provided or if the -h or --help option is given
if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  display_usage
  exit 0
fi

# Command-line argument parsing
while [ $# -gt 0 ]; do
  case "$1" in
  -c | --create)
    create_user
    ;;
  -d | --delete)
    delete_user
    ;;
  -r | --reset)
    reset_pass
    ;;
  -l | --list)
    list_users
    ;;
  *)
    echo "Error: Invalid option '$1'. Use '--help' to see available options."
    exit 1
    ;;
  esac
  shift
done
