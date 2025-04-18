#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/asus/X00QD',
    'hardware/qcom-caf/sdm660',
    'hardware/qcom-caf/wlan',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/dataservices',
    'vendor/qcom/opensource/display',
]

blob_fixups: blob_fixups_user_type = {
    # remove android.hidl.base dependency
    ('system/lib64/libfm-hci.so', 'system/lib64/libwfdnative.so', 'system/lib/libfm-hci.so', 'system/lib/libwfdnative.so'): blob_fixup()
        .remove_needed('android.hidl.base@1.0.so'),

    # clear LIBC_PRIVATE symbols (unused on newer Android?)
    'vendor/lib/libmmcamera_faceproc.so': blob_fixup()
        .clear_symbol_version('__aeabi_memcpy')
        .clear_symbol_version('__aeabi_memset')
        .clear_symbol_version('__gnu_Unwind_Find_exidx'),

    # fingerprint: use libhidlbase-v32 because we need gBn/sConstructorMap
    'vendor/lib64/libvendor.goodix.hardware.fingerprintextension@1.0.so': blob_fixup()
        .replace_needed('libhidlbase.so', 'ibhidlbase-v32.so'),

   'vendor/lib64/hw/fingerprint.default.so': blob_fixup()
        .fix_soname()
}

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    # remove the dependency, the "why" is at proprietary-files_generate.sh
    ('libmmcamera_interface', 'libdrmutils', 'libsdmutils'): lib_fixup_remove,
}

module = ExtractUtilsModule(
    'X00QD',
    'asus',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
