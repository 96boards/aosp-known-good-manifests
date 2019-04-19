#!/bin/bash

SERVER="https://snapshots.linaro.org"
FILE_LIST="boot.img.xz userdata.img.xz vendor.img.xz dt.img.xz"
LICENCED_FILE_LIST="system.img.xz"
BOARD=$1
IMG_DIR=imgs

mkdir -p $IMG_DIR
cd $IMG_DIR
for board in $BOARD; do
  mkdir -p $board
  cd $board
  rm -f $FILE_LIST


  LATEST_URL="$SERVER/96boards/$BOARD/linaro/aosp-master/$2/"

  echo "Fetching from: $LATEST_URL"
  echo "$LATEST_URL" > build-url.txt

  for i in $FILE_LIST; do
    echo wget "$LATEST_URL/$i"
    wget "$LATEST_URL/$i" 2> /dev/null
  done
  for i in $LICENCED_FILE_LIST; do
     # thanks to vishal for this trick!
     echo curl --fail --silent -L --show-error -b license_accepted_eee6ac0e05136eb58db516d8c9c80d6b=yes $LATEST_URL/$i 
     curl --fail -L --show-error -b license_accepted_eee6ac0e05136eb58db516d8c9c80d6b=yes $LATEST_URL/$i -o  $i
  done

  cd ..
done
cd ..

