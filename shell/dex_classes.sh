#!/bin/bash

echo "Dexing classes..."

if [ ! -e $BIN_PATH ];
then
mkdir $BIN_PATH
fi

dalvikvm -cp /$SOURCE_DIR/lib/dx.jar dx.dx.command.Main --dex --output /$BIN_PATH/classes.dex /$CLASSES_PATH