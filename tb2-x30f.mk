DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, vendor/lenovo/achilles/achilles-vendor.mk)

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

TARGET_USES_QCOM_BSP := true
ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

#Audio
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_PACKAGES += \
    libaudioroute \
    libtinyxml \
    audio.a2dp.default \
    audio.primary.msm8909 \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1

#Camera
PRODUCT_PACKAGES += \
    camera.msm8909 \
    libcamera \
    libqomx_core \
    libmm-qcamera \
    libmmcamera_interface \
    libmmjpeg_interface \
    mm-qcamera-app
    
# Compatibility
PRODUCT_PACKAGES += \
    libboringssl-compat \
    libril_shim

#Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8909 \
    gralloc.msm8909 \
    memtrack.msm8909 \
    copybit.msm8909

# etc
#PRODUCT_PACKAGES += \
 #   init.qcom.audio.sh \
 #   init.qcom.bt.sh \
 #   init.qcom.coex.sh \
 #   init.qcom.debug.sh \
 #   init.qcom.efs.sync.sh \
 #   init.qcom.fm.sh \
 #   init.qcom.modem_links.sh \
 #   init.qcom.post_boot.sh \
 #   init.qcom.sdio.sh \
 #   init.qcom.uicc.sh \
 #   init.qcom.wifi.sh \
 #   init.qcom.zram.sh \
 #   init.qti.ims.sh \
 #   init.qti.synaptics_dsx_qhd.sh
    
# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc
    
# FM radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# GPS
PRODUCT_PACKAGES += \
    gps.msm8909
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.location \
    ro.gps.agps_provider=1


# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8909

# Lights
PRODUCT_PACKAGES += \
    lights.msm8909


# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/lenovo/achilles/ramdisk,root)

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc

PRODUCT_BOOT_JARS += \
    libstagefrighthw


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_PACKAGES += \
    libxml2


#QTIC flag
-include $(QCPATH)/common/config/qtic-config.mk

# media_profiles and media_codecs xmls for msm8909
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/media_profiles_8909.xml:system/etc/media_profiles.xml \
                      $(LOCAL_PATH)/media/media_codecs_8909.xml:system/etc/media_codecs.xml \
                      $(LOCAL_PATH)/media/media_codecs_performance_8909.xml:system/etc/media_codecs_performance.xml
endif

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
#PRODUCT_PROPERTY_OVERRIDES += \
#       dalvik.vm.heapgrowthlimit=128m \
#       dalvik.vm.heapminfree=6m
#$(call inherit-product, device/qcom/common/common.mk)

ifeq ($(strip $(TARGET_USES_QTIC)),true)
-include $(QCPATH)/common/config/rendering-engine.mk
ifneq (,$(strip $(wildcard $(PRODUCT_RENDERING_ENGINE_REVLIB))))
    MULTI_LANG_ENGINE := REVERIE
endif
endif

#Android EGL implementation
PRODUCT_PACKAGES += libGLES_android

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
    $(LOCAL_PATH)/audio/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/mixer_paths_msm8909_pm8916.xml:system/etc/mixer_paths_msm8909_pm8916.xml \
    $(LOCAL_PATH)/audio/mixer_paths_wcd9326_i2s.xml:system/etc/mixer_paths_wcd9326_i2s.xml \
    $(LOCAL_PATH)/audio/mixer_paths_skua.xml:system/etc/mixer_paths_skua.xml \
    $(LOCAL_PATH)/audio/mixer_paths_skuc.xml:system/etc/mixer_paths_skuc.xml \
    $(LOCAL_PATH)/audio/mixer_paths_skue.xml:system/etc/mixer_paths_skue.xml \
    $(LOCAL_PATH)/audio/mixer_paths_qrd_skut.xml:system/etc/mixer_paths_qrd_skut.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml

PRODUCT_BOOT_JARS += qcom.fmradio \

PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += qcmediaplayer

ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += oem-services
PRODUCT_BOOT_JARS += com.qti.dpmframework
PRODUCT_BOOT_JARS += dpmapi
PRODUCT_BOOT_JARS += com.qti.location.sdk
endif

# Listen configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml

# Feature definition files for msm8909
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml


PRODUCT_PACKAGES += fstab.qcom


PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing

#OEM Services library
PRODUCT_PACKAGES += oem-services
PRODUCT_PACKAGES += libsubsystem_control
PRODUCT_PACKAGES += libSubSystemShutdown

PRODUCT_PACKAGES += wcnss_service

PRODUCT_PACKAGES += hwdiag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:persist/WCNSS_wlan_dictionary.dat \
    $(LOCAL_PATH)/wifi/wlan_mac.bin:persist/wlan_mac.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.currenttest.timeout.sh:system/etc/init.currenttest.timeout.sh

PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf
    
PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    wcnss_service


PRODUCT_PACKAGES += \
AntHalService \
libantradio \
antradio_app

PRODUCT_PACKAGE_OVERLAYS := $(QCPATH)/qrdplus/Extension/res-overlay \
        $(PRODUCT_PACKAGE_OVERLAYS)

ifeq ($(findstring AR6500,$(YEP_PRODUCT_NAME)),AR6500)
	include product_config_A6500/product_config.mk
endif

ifeq ($(findstring AR6501,$(YEP_PRODUCT_NAME)),AR6501)
        include product_config_A6501/product_config.mk
endif

ifeq ($(findstring AR6502,$(YEP_PRODUCT_NAME)),AR6502)
        include product_config_A6502/product_config.mk
endif

ifeq ($(findstring AR6505,$(YEP_PRODUCT_NAME)),AR6505)
        include product_config_A6505/product_config.mk
endif



PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1
	

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:system/etc/sensors/hals.conf


PRODUCT_PACKAGES += \
         CountryList
         
PRODUCT_PACKAGES += \
        setproperties
        
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lenovo/achilles/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
        
PRODUCT_COPY_FILES := \
$(LOCAL_PATH)/kernel:kernel



