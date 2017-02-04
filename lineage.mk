# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/kis3/kis3.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kis3
PRODUCT_NAME := lineage_kis3
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Kis 3
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := Kis 3

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="msm8610-user 4.4.2 KOT49H eng.root.20140509.130110 release-keys" \
    BUILD_FINGERPRINT="ZTE/ZTE-P821E10/ZTE-P821E10:4.4.2/KOT49H/eng.root.20140509.130110:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-zte
