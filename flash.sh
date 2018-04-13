#!/bin/bash

DIRPATH=imgs
BOARD=$1

if [ $# -eq 0 ]; then
   echo "Error: No arguments"
   echo "Usage: ./flash.sh <valid board name>"
   exit -1
fi


if [ ! -d "$DIRPATH/$BOARD" ]; then
  echo "ERROR: No such path: $DIRPATH/$BOARD"
  exit -1
fi

pushd $DIRPATH/$BOARD > /dev/null

echo "Extracting images"

IMGS="boot.img system.img cache.img userdata.img dt.img vendor.img"
for i in $IMGS; do
  xz -k -d $i.xz
done

echo "Flashing $BOARD"
#special case for hikey960 dts partition
if [ "$BOARD"  == "hikey960" ] ; then
   fastboot flash dts dt.img
fi
fastboot flash boot boot.img
fastboot flash cache cache.img
fastboot flash system system.img  
fastboot flash vendor vendor.img
# we skip flashing userdata here

fastboot reboot

#cleanup
rm -f $IMGS

popd >/dev/null

