
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product-if-exists, vendor/zte/kis3/kis3-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
       ro.moz.omx.hw.max_width=1280 \
       ro.moz.omx.hw.max_height=720 \

PRODUCT_DEVICE := kis3
PRODUCT_NAME := kis3
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Kis 3
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Kis 3

PRODUCT_BOOT_JARS += qcmediaplayer:oem-services:qcom.fmradio:org.codeaurora.Performance:vcard

# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_PACKAGES += wcnss_service

# Gecko low-memory killer setting overrides
#
# It would be nice to use PRODUCT_COPY_FILES here instead but that is not
# currently possible due to various |rm -rf ...| commands in
# {gaia,gonk-misc}/Android.mk that Make does not know about.
#
out/target/product/$(TARGET_PRODUCT)/system/gecko: gaia/profile/defaults/pref/lmk.js
.PHONY: gaia/profile/defaults/pref/lmk.js
gaia/profile/defaults/pref/lmk.js: gaia/profile.tar.gz
	echo 'pref("hal.processPriorityManager.gonk.BACKGROUND.KillUnderKB", 10240);' > $@
	echo 'pref("hal.processPriorityManager.gonk.notifyLowMemUnderKB", 9216);' >> $@

# Target-specific Gaia configuration
LOCAL_PATH:=$(dir $(firstword $(MAKEFILE_LIST)))
GAIA_DISTRIBUTION_SRC_FILES:=$(GAIA_DISTRIBUTION_SRC_FILES)
GAIA_DISTRIBUTION_SRC_FILES+=$(wildcard $(LOCAL_PATH)/gaia_distribution/*)

$(call inherit-product, device/zte/kis3/prebuilt.mk)
