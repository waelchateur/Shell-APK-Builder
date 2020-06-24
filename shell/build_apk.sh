#!/bin/bash

echo "Building APK..."

/$AAPT_PATH package --version-code 1 --version-name 1.0 --min-sdk-version 14 --target-sdk-version 21 -S /$RES_PATH -M /$MANIFEST_PATH -I /$BOOTCLASS_PATH -F /$BIN_PATH/app.unsigned.apk /$BIN_PATH