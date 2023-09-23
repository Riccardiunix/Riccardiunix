#!/bin/sh
#https://fedoramagazine.org/randomize-mac-address-nm/
printf "SSID: ";read SSID
printf "PSW: ";read PSW

nmcli device wifi connect $SSID password "$PSW" hidden yes || exit 1

nmcli c modify $(nmcli c | grep $SSID | awk '{print $2}') 802-11-wireless.cloned-mac-address permanent
