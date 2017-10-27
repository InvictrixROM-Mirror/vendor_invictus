#!/bin/sh

# assumes the image zip has been extracted in /tmp

emulator  -verbose -skindir $ANDROID_BUILD_TOP/vendor/invictus/utils/emulator/skins/ -skin pixel_xl -ramdisk $ANDROID_HOME/system-images/android-26/google_apis/x86/ramdisk.img  -kernel $ANDROID_HOME/system-images/android-26/google_apis/x86/kernel-ranchu -gpu host
