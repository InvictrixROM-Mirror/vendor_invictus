#!/bin/sh

# assumes the image zip has been extracted in /tmp
export ANDROID_BUILD_TOP=/tmp/generic_x86
export ANDROID_PRODUCT_OUT=/tmp/generic_x86

$ANDROID_HOME/tools/emulator  -verbose -skindir /tmp/generic_x86/skins/ -skin pixel_xl -kernel $ANDROID_HOME/system-images/android-26/google_apis/x86/kernel-ranchu -gpu host -ramdisk $ANDROID_HOME/system-images/android-26/google_apis/x86/ramdisk.img
