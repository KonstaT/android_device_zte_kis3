TARGET_USES_QCOM_BSP := true
BOARD_HAVE_QCA_NFC := true

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

DEVICE_PACKAGE_OVERLAYS := device/qcom/msm8610/overlay

#TARGET_DISABLE_DASH := true
#TARGET_DISABLE_OMX_SECURE_TEST_APP := true

ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
# media_profiles and media_codecs xmls for 8610
PRODUCT_COPY_FILES += device/qcom/msm8610/media/media_profiles_8610.xml:system/etc/media_profiles.xml \
                      device/qcom/msm8610/media/media_codecs_8610.xml:system/etc/media_codecs.xml
endif #TARGET_ENABLE_QC_AV_ENHANCEMENTS

$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_NAME := msm8610
PRODUCT_DEVICE := msm8610

PRODUCT_BOOT_JARS += qcmediaplayer:oem-services:qcom.fmradio:org.codeaurora.Performance

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8610/audio_policy.conf:system/etc/audio_policy.conf \
    device/qcom/msm8610/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/qcom/msm8610/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom
PRODUCT_COPY_FILES += \
    device/qcom/msm8610/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/qcom/msm8610/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8610/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

#ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service

# Sensors feature definition file/s
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_COPY_FILES += \
    device/qcom/msm8610/whitelist_appops.xml:system/etc/whitelist_appops.xml

# NFC packages
ifeq ($(BOARD_HAVE_QCA_NFC),true)
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.msm8610 \
    NfcNci \
    Tag \
    com.android.nfc_extras

# file that declares the MIFARE NFC constant
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
        packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
        frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml
endif # BOARD_HAVE_QCA_NFC
