#!/bin/sh
#https://fedoramagazine.org/randomize-mac-address-nm/
echo "SSID: ";read SSID
echo "PSW: ";read PSW

nmcli device wifi connect $SSID password "$PSW" hidden yes

nmcli c modify $(nmcli c | grep $SSID | awk '{print $2}') 802-11-wireless.cloned-mac-address permanent
