# Copyright (C) 2017 Paranoid Android
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

# Check for the target product.
ifeq (pa_lithium,$(TARGET_PRODUCT))

# Inherit from those products, most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Most advanced platform features, first.
TARGET_WANTS_EXTENDED_DPM_PLATFORM := true

# Use AOSP camera application.
TARGET_USES_AOSP_CAMERA := true

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/xiaomi/lithium/device.mk)

# Override device build properties.
PRODUCT_NAME := pa_lithium
PRODUCT_DEVICE := lithium
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI MIX
PRODUCT_MANUFACTURER := Xiaomi

# Google client ID.
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="lithium" \
    PRODUCT_NAME="lithium" \
    BUILD_FINGERPRINT="Xiaomi/lithium/lithium:6.0.1/MXB48T/V8.2.4.0.MAHMIDL:user/release-keys" \
    PRIVATE_BUILD_DESC="lithium-user 6.0.1 MXB48T V8.2.4.0.MAHMIDL release-keys"

TARGET_VENDOR := Xiaomi

# Paranoid Android platform
include vendor/pa/main.mk

endif
