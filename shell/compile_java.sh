#!/bin/bash

echo "Compiling..."

if [ ! -e $CLASSES_PATH ];
then
mkdir $CLASSES_PATH
fi

dalvikvm -cp /$SOURCE_DIR/lib/ecj.jar org.eclipse.jdt.internal.compiler.batch.Main -warn:none -proc:none -7 -d /$CLASSES_PATH /$SRC_PATH /$GEN_PATH -bootclasspath /$BOOTCLASS_PATH