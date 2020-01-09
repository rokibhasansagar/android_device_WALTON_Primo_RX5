#
# Copyright (C) 2018 The Android Open-Source Project
#                    The TwrpBuilder Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Copy zImage into place
PRODUCT_COPY_FILES += device/WALTON/Primo_RX5/prebuilt/zImage:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*

# Set the main device brand flags
PRODUCT_DEVICE := Primo_RX5
PRODUCT_NAME := omni_Primo_RX5
PRODUCT_BRAND := WALTON
PRODUCT_MODEL := Primo_RX5
PRODUCT_MANUFACTURER := WALTON

# From full_base.mk
# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US

# From runtime_libart.mk
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    ro.dalvik.vm.native.bridge=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    pm.dexopt.first-boot=interpret-only \
    pm.dexopt.boot=verify-profile \
    pm.dexopt.install=interpret-only \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.ab-ota=speed-profile \
    pm.dexopt.nsys-library=speed \
    pm.dexopt.shared-apk=speed \
    pm.dexopt.forced-dexopt=speed \
    pm.dexopt.core-app=speed \
    dalvik.vm.image-dex2oat-filter=verify-at-runtime \
    dalvik.vm.dex2oat-filter=verify-at-runtime \
    dalvik.vm.usejit=true

# adb is already there, so just add mtp for now
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="WALTON/Primo_RX5/Primo_RX5:6.0/MRA58K/1465782828:user/release-keys" \
    PRIVATE_BUILD_DESC="full_gionee6735_65u_m0-user 6.0 MRA58K 1465782828 release-keys"

# try force addition of fingerprint
BUILD_FINGERPRINT := "WALTON/Primo_RX5/Primo_RX5:6.0/MRA58K/1465782828:user/release-keys"

