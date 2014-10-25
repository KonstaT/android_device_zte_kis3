
DEVICE_PACKAGE_OVERLAYS := device/zte/kis3/overlay

$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/zte/kis3/kis3-vendor.mk)

PRODUCT_DEVICE := kis3
PRODUCT_NAME := kis3
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Kis 3
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Kis 3

PRODUCT_BOOT_JARS += qcmediaplayer:qcom.fmradio:org.codeaurora.Performance

# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing

# Bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Lights
PRODUCT_PACKAGES += \
    lights.MSM8610

# Wifi
PRODUCT_PACKAGES += \
    wcnss_service

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/kis3/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/zte/kis3/prebuilt/system,system)

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml
