#!/bin/bash

echo "Signing APK..."

dalvikvm -cp /$SOURCE_DIR/lib/apksigner.jar net.fornwall.apksigner.Main -p android /$PROJECT_PATH/keystore.jks /$BIN_PATH/app.unsigned.apk /$BIN_PATH/app.signed.apk