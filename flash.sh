#!/bin/bash

DIRPATH=imgs
BOARD=$1

if [ $# -eq 0 ]; then
   echo "Error: No arguments"
   echo "Usage: ./flash.sh <valid board name>"
   exit -1
fi

echo "Flashing $BOARD"

if [ ! -d "$DIRPATH/$BOARD" ]; then
  echo "ERROR: No such path: $DIRPATH/$BOARD"
  exit -1
fi

pushd $DIRPATH/$BOARD > /dev/null

IMGS="boot.img.xz system.img.xz cache.img.xz userdata.img.xz dt.img.xz"
for i in $IMGS; do
  xz -d $i
done

#special case for hikey960 dts partition
if [$BOARD -eq "hikey960" ] ; then
   fastboot flash dts dt.img
fi
fastboot flash boot boot.img
fastboot flash cache cache.img
fastboot flash system system.img  
# we skip flashing userdata here

fastboot reboot
popd >/dev/null

