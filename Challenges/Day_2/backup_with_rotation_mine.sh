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

display_usage() {
  echo "Usage: $0 /path/to/source_directory"
}

if [[ $# -eq 0 ]] || [[ ! -d "$1" ]]; then
  echo "Error: Please provide a valid source directory"
  display_usage
  exit 1
fi

source_dir="$1"

create_backup() {
  local timestamp=$(date '+%Y-%m-%d_%H-%M')
  local backup_dir="$source_dir/backup_${timestamp}"

  mkdir -p "$backup_dir"
  echo "Backup created successfully: $backup_dir"
}

create_backup
