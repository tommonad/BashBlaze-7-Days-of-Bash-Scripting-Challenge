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
# Created: 2026-02-10                                  #
########################################################

function view_system_metrics() {
  echo
  echo "  ---- System Metrics ----"
  echo
  # Fetch CPU usage using `top` command and extract the value using awk
  cpu_usage=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')
  # Fetch memory usage using `free` command and extract the value using awk
  mem_usage=$(free | grep Mem | awk '{printf("%.1f", $3/$2 * 100)}')
  # Fetch disk space usage using `df` command and extract the value using awk
  disk_usage=$(df | awk 'NR==2 {print $5}')

  echo -e "\tCPU Usage:  $cpu_usage%\n\tMem Usage: $mem_usage%\n\tDisk Space:  $disk_usage"
}

# Function to monitor a service
function monitor_service() {
  echo
  echo "  ---- Monitor a service ----"
  echo
  read -rp "Enter the name of the service to monitor: " service_name

  # Check if the service is running
  if systemctl is-active --quiet "$service_name"; then
    echo "$service_name is running."
  else
    echo "$service_name is not running."
    read -rp "Do you want to start the $service_name? (Y/N): " choice
    if [[ "$choice" = "Y" ]] || [[ "$choice" = "y" ]]; then
      # Start the service
      sudo systemctl start "$service_name"
      echo "$service_name started sucessfully."
    fi
  fi
}

# Main loop for continuous monitoring
while true; do
  echo
  echo "  ---- Monitoring Metrics Script ----"
  echo
  echo -e "\t1. View System Metrics"
  echo -e "\t2. Monitor a Specific Service"
  echo -e "\t3. Exit"
  echo
  read -rp "Enter your choice (1, 2, or 3): " choice

  case $choice in
  1)
    view_system_metrics
    ;;
  2)
    monitor_service
    ;;
  3)
    echo "Exiting the script. Goodbye!"
    exit 0
    ;;
  *)
    echo "Error: Invalid option. Please choose a valid option (1, 2, or 3)."
    ;;
  esac

  # Sleep for 5 seconds before displaying the menu again
  sleep 2
done
