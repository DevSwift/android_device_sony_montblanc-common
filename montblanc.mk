# Inherit from AOSP
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# hardware
$(call inherit-product, device/sony/montblanc-common/hardware/common.mk)

# gApps binaries
$(call inherit-product-if-exists, vendor/google/gapps.mk)

# Inherit from the vendor common montblanc definitions
$(call inherit-product-if-exists, vendor/sony/montblanc-common/montblanc-common-vendor.mk)

# Common montblanc headers
TARGET_SPECIFIC_HEADER_PATH := device/sony/montblanc-common/include

# Common montblanc settings overlays
DEVICE_PACKAGE_OVERLAYS += device/sony/montblanc-common/overlay

# Common montblanc features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Configuration files
PRODUCT_COPY_FILES += \
        device/sony/montblanc-common/config/media_codecs.xml:system/etc/media_codecs.xml \
        device/sony/montblanc-common/config/egl.cfg:system/lib/egl/egl.cfg \
        device/sony/montblanc-common/config/asound.conf:system/etc/asound.conf \
        device/sony/montblanc-common/config/hostapd.conf:system/etc/wifi/hostapd.conf \
        device/sony/montblanc-common/config/01stesetup:system/etc/init.d/01stesetup \
        device/sony/montblanc-common/config/10wireless:system/etc/init.d/10wireless \
        device/sony/montblanc-common/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        device/sony/montblanc-common/config/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf
		
# Audio HAL
PRODUCT_PACKAGES += \
   libalsactrl.so \
   libste_adm.so \
   libstelpcutils.so \
   audio_policy.montblanc \
   audio.primary.montblanc
   
# libgralloc
PRODUCT_PACKAGES += \
   gralloc.montblanc
   
# libcopybit
PRODUCT_PACKAGES += \
   copybit.montblanc
        
# KitKat Launcher
PRODUCT_PACKAGES += Launcher3        

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs \
        e2fsck

# Lights HAL library
PRODUCT_PACKAGES += lights.montblanc

# b2r2lib
PRODUCT_PACKAGES += libblt_hw
 
# libomxil-bellagio
PRODUCT_PACKAGES += libomxil-bellagio
   
# libtinyalsa & audio.usb.default
PRODUCT_PACKAGES += \
       tinyalsa \
       libtinyalsa \
       audio_policy.default \
       audio.usb.default
       
# WiFi config utility
PRODUCT_PACKAGES += iw
       
# libaudioparameter
PRODUCT_PACKAGES += libaudioparameter

# Hostapd
PRODUCT_PACKAGES += \
       hostapd_cli \
       hostapd

       
# lib_net_iface_cmd
PRODUCT_PACKAGES += libnetcmdiface

# Libasound
PRODUCT_PACKAGES += libasound

# File Manager
PRODUCT_PACKAGES += CMFileManager

# Torch
PRODUCT_PACKAGES += Torch

# Music & DSP
PRODUCT_PACKAGES += \
       Apollo \
       DSPManager \
       audio_effects.conf \
       libcyanogen-dsp

# FM Radio
# We must adapt Qualcomm FM Radio app

# Misc
PRODUCT_PACKAGES += com.android.future.usb.accessory

# BlueZ
PRODUCT_PACKAGES += \
        libglib \
        bluetoothd \
        bluetooth.default \
        haltest \
        btmon \
        btproxy \
        audio.a2dp.default \
        l2test \
        bluetoothd-snoop \
        init.bluetooth.rc \
        btmgmt \
        hcitool \
        l2ping \
        avtest \
        libsbc \
        hciattach
        
# Custom init scripts
PRODUCT_COPY_FILES += \
        device/sony/montblanc-common/config/init.rc:root/init.rc \
        device/sony/montblanc-common/config/init.environ.rc:root/init.environ.rc \
        device/sony/montblanc-common/config/init.st-ericsson.rc:root/init.st-ericsson.rc \
        device/sony/montblanc-common/config/ueventd.st-ericsson.rc:root/ueventd.st-ericsson.rc \
        external/koush/Superuser/init.superuser.rc:root/init.superuser.rc

# Post recovery script
PRODUCT_COPY_FILES += \
        device/sony/montblanc-common/recovery/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh

# Hardware configuration scripts
PRODUCT_COPY_FILES += \
        device/sony/montblanc-common/config/omxloaders:system/etc/omxloaders \
        device/sony/montblanc-common/config/ril_config:system/etc/ril_config \
        device/sony/montblanc-common/config/install_wlan.sh:system/bin/install_wlan.sh \
        device/sony/montblanc-common/config/ste_modem.sh:system/etc/ste_modem.sh \
        device/sony/montblanc-common/config/gps.conf:system/etc/gps.conf

# Garbage Collector type
PRODUCT_TAGS += dalvik.gc.type-precise
