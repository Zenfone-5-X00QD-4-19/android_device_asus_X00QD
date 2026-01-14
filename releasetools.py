# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
# Copyright (C) 2017-2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImageRadio(info, basename, dest):
  name = basename
  path = "RADIO/" + name
  if path not in info.input_zip.namelist():
    return

  data = info.input_zip.read(path)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info):
  # Firmware
  AddImageRadio(info, "mdtpsecapp.mbn", "/dev/block/bootdevice/by-name/mdtpsecapp")
  AddImageRadio(info, "hyp.mbn", "/dev/block/bootdevice/by-name/hyp")
  AddImageRadio(info, "pmic.elf", "/dev/block/bootdevice/by-name/pmic")
  AddImageRadio(info, "abl.elf", "/dev/block/bootdevice/by-name/abl")
  AddImageRadio(info, "rpm.mbn", "/dev/block/bootdevice/by-name/rpm")
  AddImageRadio(info, "xbl.elf", "/dev/block/bootdevice/by-name/xbl")
  AddImageRadio(info, "cmnlib64.mbn", "/dev/block/bootdevice/by-name/cmnlib64")
  AddImageRadio(info, "cmnlib.mbnf", "/dev/block/bootdevice/by-name/cmnlib")
  AddImageRadio(info, "devcfg.mbn", "/dev/block/bootdevice/by-name/devcfg")
  AddImageRadio(info, "keymaster64.mbn", "/dev/block/bootdevice/by-name/keymaster")
  AddImageRadio(info, "tz.mbn", "/dev/block/bootdevice/by-name/tz")
  AddImageRadio(info, "BTFM.bin", "/dev/block/bootdevice/by-name/bluetooth")
  AddImageRadio(info, "mdtp.img", "/dev/block/bootdevice/by-name/mdtp")
  AddImageRadio(info, "dspso.bin", "/dev/block/bootdevice/by-name/dsp")
  AddImageRadio(info, "NON-HLOS.bin", "/dev/block/bootdevice/by-name/modem")
  AddImageRadio(info, "logfs_ufs_8mb.bin", "/dev/block/bootdevice/by-name/logfs")
  AddImageRadio(info, "asusfw.img", "/dev/block/bootdevice/by-name/asusfw")
  return
