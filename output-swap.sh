#!/bin/bash
#pacmd set-default-sink "<alsa_output.pci-0000_0b_00.3.analog-stereo>"
#pacmd set-default-sink "<alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.analog-mono>"
# https://askubuntu.com/questions/835740/switch-audio-device-via-bash-command
SINK=`pacmd list-sinks | grep '  index' | cut -f6 -d' '`
pacmd set-default-sink ${SINK}
pacmd list-sink-inputs | grep index | while read line
do
pacmd move-sink-input `echo $line | cut -f2 -d' '` ${SINK}
done