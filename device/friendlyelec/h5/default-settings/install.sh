#!/bin/bash
set -eu
ROOTFS_DIR=$1

function setup_openwrt()
{
# dist
    mkdir -p ./run  # for overlayfs ramdisk

    if [ -f ./etc/modules.d/brcmfmac ]; then
    	mv ./etc/modules.d/brcmfmac ./etc/modules.d/10-brcmfmac
    fi

    mkdir -p ./boot
    chmod 0755 ./boot
    echo '/dev/mmcblk0p1    /boot vfat defaults 0 0' > ./etc/fstab

}

(cd ${ROOTFS_DIR} && {
	setup_openwrt
})
