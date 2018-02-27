#!/bin/bash

DIRPATH=imgs
MANIFEST=pinned-manifest.xml
BUILD_URL_FILE=build-url.txt
BOARD=$1

if [ $# -eq 0 ]; then
   echo "Error: No arguments"
   echo "Usage: ./bless-good.sh <valid board name>"
   exit -1
fi

echo "Blessing $BOARD"

if [ ! -d "$DIRPATH/$BOARD" ]; then
  echo "ERROR: No such path: $DIRPATH/$BOARD"
  exit -1
fi

pushd $DIRPATH/$BOARD > /dev/null

rm -f pinned-manifest.xml

URL=`cat $BUILD_URL_FILE`
wget $URL/$MANIFEST 2> /dev/null

RAW_DATE=`stat -c "%y" $MANIFEST`
DATE_HEADER=`date -u --date="$RAW_DATE" +%F_%T`

NEW_MANIFEST=$DATE_HEADER-$MANIFEST
echo $NEW_MANIFEST
mv $MANIFEST $NEW_MANIFEST

NEW_BUILD_URL_FILE="$DATE_HEADER-$BUILD_URL_FILE"
echo $NEW_BUILD_URL_FILE
cp $BUILD_URL_FILE $NEW_BUILD_URL_FILE

popd >/dev/null

mkdir -p known-good/$BOARD
cp $DIRPATH/$BOARD/$NEW_MANIFEST known-good/$BOARD/
cp $DIRPATH/$BOARD/$NEW_BUILD_URL_FILE known-good/$BOARD/

echo "No don't forget to commit the files!"
