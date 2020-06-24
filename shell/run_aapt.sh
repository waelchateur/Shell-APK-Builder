#!/bin/bash

echo "Running aapt..."

if [ ! -e $GEN_PATH ];
then
mkdir $GEN_PATH
fi

/$AAPT_PATH package -m -S /$RES_PATH -J /$GEN_PATH -M /$MANIFEST_PATH -I /$BOOTCLASS_PATH