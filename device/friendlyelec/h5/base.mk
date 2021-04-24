#!/bin/bash

TARGET_PLAT=h5
TARGET_ARCH=arm64
CROSS_COMPILER=aarch64-linux-gnu-
TARGET_OSNAME=openwrt_4.14_arm64

# FriendlyWRT
# 

TARGET_OPENWRT_CONFIG=config_h5
OPENWRT_SRC=openwrt
OPENWRT_PACKAGES+=(packages/pkg1)
OPENWRT_PACKAGES+=(packages/pkg2)
OPENWRT_FILES+=(device/friendlyelec/h5/default-settings)
OPENWRT_FILES+=(device/friendlyelec/h5/common-files)

# U-boot
# 

TARGET_UBOOT_CONFIG=nanopi_h5_defconfig

# Kernel
# 

TARGET_KERNEL_CONFIG=sunxi_arm64_defconfig
TARGET_KERNEL_DTB=sun50i-h5-nanopi*.dtb

# Misc
# 
OPENWRT_ROOTFS=build_dir/target-aarch64_cortex-a53_musl/root-sunxi
TARGET_IMAGE_DIRNAME=openwrt_4.14_arm64
TARGET_SD_RAW_FILENAME=Openwrt_$(date +%Y%m%d)_H5_aarch64_sd.img
TARGET_EFLASHER_RAW_FILENAME=Openwrt_$(date +%Y%m%d)_H5_aarch64_eflasher.img


