#
# Copyright (C) 2012 The CyanogenMod Project
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
#
# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800
TARGET_BOOTANIMATION_HALF_RES := true

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/tb2x30f/full_tb2x30f.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_tb2x30f
PRODUCT_BRAND := lenovo
PRODUCT_DEVICE := tb2x30f
PRODUCT_MODEL := TB2-X30F
PRODUCT_MANUFACTURER := lenovo

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Lenovo/TB2-X30F/TB2-X30F:6.0.1/LenovoTB2-X30F/TB2-X30F_S000038_180317_ROW:user/release-keys \
	PRIVATE_BUILD_DESC="msm8909-user 6.0.1 LenovoTB2-X30F TB2-X30F_S000038_180317_ROW release-keys"
