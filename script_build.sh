#!/bin/bash
 
# ccache
export USE_CCACHE=1
export CCACHE_DIR=/home/ccache/rohan  

export KBUILD_BUILD_USER=#Rohan
export KBUILD_BUILD_HOST=UbuntuZeus

echo -e "Checking device trees"
if [ -d "device/motorola/sanders" ];
then
        device="sanders"
elif [ -d "device/xiaomi/tissot" ];
then
        device="tissot"
else
        echo -e "\nEnter the device name"
        read device
        echo -e "\nEnter the branch name"
        read branch
        if [ device=="sanders" ];
        then
        git clone https://github.com/DRohan007/android_device_motorola_sanders -b $branch device/motorola/sanders
        git clone https://github.com/DRohan007/proprietary_vendor_motorola_sanders -b $branch vendor/motorola/sanders
        fi
fi

# build
. build/envsetup.sh
#Clean
make  clean && make clobber
lunch lineage_$device-userdebug
make bacon -j8
