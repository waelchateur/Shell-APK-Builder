#!/bin/bash

export SCRIPT_PATH=$(readlink -f $0)
export SCRIPT_DIR=$(dirname $SCRIPT_PATH)
export SOURCE_DIR=$(dirname $SCRIPT_DIR)
export BOOTCLASS_PATH=$SOURCE_DIR/lib/android.jar
export PROJECT_PATH=/storage/emulated/0/project
export MANIFEST_PATH=$PROJECT_PATH/AndroidManifest.xml
export CLASSES_PATH=$PROJECT_PATH/classes
export SRC_PATH=$PROJECT_PATH/src
export RES_PATH=$PROJECT_PATH/res
export GEN_PATH=$PROJECT_PATH/gen
export BIN_PATH=$PROJECT_PATH/bin

CPU_ABI=$(getprop ro.product.cpu.abi)

if [ "$CPU_ABI" == "armeabi-v7a" ] ||
   [ "$CPU_ABI" == "arm64-v8a" ]; then
export AAPT_PATH=$SOURCE_DIR/bin/aapt-arm
fi

if [ "$CPU_ABI" == "x86" ] ||
   [ "$CPU_ABI" == "x86_64" ]; then
export AAPT_PATH=$SOURCE_DIR/bin/aapt-x86
fi

rm -r $PROJECT_PATH
mkdir $PROJECT_PATH

$SOURCE_DIR/bin/unzip $SOURCE_DIR/project.zip -d $PROJECT_PATH
$SCRIPT_DIR/run_aapt.sh
$SCRIPT_DIR/compile_java.sh
$SCRIPT_DIR/dex_classes.sh
$SCRIPT_DIR/build_apk.sh
$SCRIPT_DIR/sign_apk.sh

echo "Compilation complete"
