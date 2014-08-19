# Ramdisk
PRODUCT_COPY_FILES := \
  $(call find-copy-subdir-files,*,device/zte/kis3/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
  $(call find-copy-subdir-files,*,device/zte/kis3/prebuilt/system,system)
