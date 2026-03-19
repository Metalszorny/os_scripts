#!/usr/bin/env bash
#!/usr/bin/env

WIRELESS_DEVICE_NAME="wlan0"
WIRELESS_SSID=""
WIRELESS_PASSWORD=""

##########
# Set installation keymap
##########
#localectl list-keymaps
#localectl list-keymaps | grep -i hu
loadkeys uk

##########
# Update system clock
##########
timedatectl set-ntp true

##########
# Set up network connection
##########
iwctl
#device list
#device [selected_station] set-property Powered on
#station [WIRELESS_DEVICE_NAME] scan
#station [WIRELESS_DEVICE_NAME] get-networks
station [WIRELESS_DEVICE_NAME] connect [WIRELESS_SSID] --passphrase [WIRELESS_PASSWORD]
exit
#ip addr show
