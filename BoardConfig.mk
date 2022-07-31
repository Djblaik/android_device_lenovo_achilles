#
# Copyright (C) 2016 The CyanogenMod Project
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

LOCAL_PATH := device/lenovo/achilles

#assert
TARGET_OTA_ASSERT_DEVICE := achilles,a10-30l,a10-30f

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOARD_PLATFORM_GPU := qcom-adreno304
TARGET_BOOTLOADER_BOARD_NAME := msm8909

#architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
#TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Inline kernel building
BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE 	 := 2048
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0X00000100
BOARD_SECOND_OFFSET	 := 0x00f00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk
#TARGET_PREBUILT_KERNEL := device/lenovo/achilles/kernel
TARGET_KERNEL_SOURCE := kernel/lenovo/msm8909
TARGET_KERNEL_CONFIG := achilles_defconfig
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
TARGET_KERNEL_ARCH := arm

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

# Audio
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
#USE_DEVICE_SPECIFIC_CAMERA := true
#BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
#TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true


# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Enables CSVT
TARGET_USES_CSVT := true

# FM radio
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true


# Graphics
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := \
    hardware/cyanogen/cmhw \
    $(LOCAL_PATH)/cmhw

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/


# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partition sizes

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000 # (16M)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x02000000 # (16M)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12277759488
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
#BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab


# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/lenovo/achilles/sepolicy
	
# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 65

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
