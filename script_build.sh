#!/bin/bash
 
# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/rohan  
prebuilts/misc/linux-x86/ccache/ccache -M 50G

export KBUILD_BUILD_USER=#Rohan
export KBUILD_BUILD_HOST=UbuntuZeus

#Clean
make  clean && make clobber

# Killing...
prebuilts/sdk/tools/jack-admin kill-server
# Starting...
prebuilts/sdk/tools/jack-admin start-server

# build
. build/envsetup.sh
#export WITH_MAGISK=true
#export WITH_SU=true
#export OTA_TYPE=Official
#export OTA_TYPE=experimental
#breakfast lettuce
lunch lineage_$device-userdebug
make bacon -j8
