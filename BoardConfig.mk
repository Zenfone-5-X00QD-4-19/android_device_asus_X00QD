#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/X00QD

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B
AB_OTA_UPDATER := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73


# Assert
TARGET_OTA_ASSERT_DEVICE := ASUS_X00QD,X00QD,X00Q

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Audio
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_SSR := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm636
TARGET_NO_BOOTLOADER := true

# Broken rules
BUILD_BROKEN_DUP_RULES := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_USES_QTI_CAMERA_DEVICE := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Display
TARGET_SCREEN_DENSITY := 420
TARGET_USES_GRALLOC1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0xc170000 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += sched_enable_hmp=1 sched_enable_power_aware=1
BOARD_KERNEL_CMDLINE += service_locator.enable=1 loop.max_part=7
BOARD_KERNEL_CMDLINE += printk.devkmsg=on
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
TARGET_KERNEL_CLANG_VERSION := r547379
TARGET_KERNEL_CONFIG := vendor/X00QD_defconfig vendor/debugfs.config
TARGET_KERNEL_SOURCE := kernel/asus/sdm660
TARGET_KERNEL_VERSION := 4.19

# Kernel Clang Flags
KERNEL_CC := CC=clang
override KERNEL_TOOLCHAIN_PREFIX_arm := arm-linux-android-

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_X00QD
TARGET_RECOVERY_DEVICE_MODULES := libinit_X00QD

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# LMKD
TARGET_LMKD_STATS_LOG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_VENDOR := vendor

AB_OTA_UPDATER := false

BOARD_ROOT_EXTRA_FOLDERS := APD asdf odm oem

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /vendor/ADF:/ADF \
    /vendor/factory:factory

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_ENFORCES_QSSI := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/4-0038/dclick_mode"

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Sepolicy
include device/lineage/sepolicy/libperfmgr/sepolicy.mk
include device/qcom/sepolicy-legacy-um/SEPolicy.mk

BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Treble
BOARD_VNDK_VERSION := current

# Vendor Security patch level
VENDOR_SECURITY_PATCH := 2020-12-05

# Verity
# Only needed for signing
BOARD_AVB_ENABLE := false

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit the proprietary files
include vendor/asus/X00QD/BoardConfigVendor.mk
