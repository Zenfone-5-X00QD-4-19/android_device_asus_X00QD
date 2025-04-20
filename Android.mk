#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter X00QD,$(TARGET_DEVICE)),)
  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

# A/B builds require us to create the mount points at compile time.
# Just creating it for all cases since it does not hurt.
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
BT_FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/bt_firmware
DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp

$(FIRMWARE_MOUNT_POINT):
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

ADF_MOUNT_POINT := $(TARGET_OUT_VENDOR)/ADF
$(ADF_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(ADF_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/ADF

BT_FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/bt_firmware
$(BT_FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(BT_FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/bt_firmware

DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp
$(DSP_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(DSP_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp

FACTORY_MOUNT_POINT := $(TARGET_OUT_VENDOR)/factory
$(FACTORY_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(FACTORY_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/factory

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MOUNT_POINT) $(ADF_MOUNT_POINT) $(BT_FIRMWARE_MOUNT_POINT) $(DSP_MOUNT_POINT) $(FACTORY_MOUNT_POINT)

APD_MOUNT_SYMLINK := $(TARGET_OUT_VENDOR)/APD
$(APD_MOUNT_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating APD mount symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /APD $@

ALL_DEFAULT_INSTALLED_MODULES += $(APD_MOUNT_SYMLINK)

ASDF_MOUNT_SYMLINK := $(TARGET_OUT_VENDOR)/asdf
$(ASDF_MOUNT_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating asdf mount symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /asdf $@

ALL_DEFAULT_INSTALLED_MODULES += $(ASDF_MOUNT_SYMLINK)

ASUSFW_MOUNT_POINT := $(TARGET_OUT_VENDOR)/asusfw
$(ASUSFW_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(ASUSFW_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/asusfw

ALL_DEFAULT_INSTALLED_MODULES += $(ASUSFW_MOUNT_POINT)

endif
