#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)
-include vendor/evolution-priv/keys/keys.mk

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
TARGET_NOT_USES_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# Inherit from X00QD device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

# Device identifier. This must come after all inclusions.
PRODUCT_BRAND := asus
PRODUCT_DEVICE := X00QD
PRODUCT_MANUFACTURER := asus
PRODUCT_MODEL := Zenfone 5
PRODUCT_NAME := lineage_X00QD
PRODUCT_GMS_CLIENTID_BASE := android-asus
TARGET_DISABLE_EPPE := true
TARGET_USES_PICO_GAPPS := true

TARGET_VENDOR_PRODUCT_NAME := X00QD
TARGET_VENDOR_DEVICE_NAME := X00QD

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=X00QD \
    DeviceProduct=WW_Phone \
    BuildDesc="WW_Phone-user 9 PPR1.180610.009 16.0615.2006.131-0 release-keys" \
    BuildFingerprint=asus/WW_Phone/ASUS_X00QD:9/PPR1.180610.009/16.0615.2006.131-0:user/release-keys
