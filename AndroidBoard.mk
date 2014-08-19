#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
include kernel/AndroidKernel.mk

$(INSTALLED_KERNEL_TARGET): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

#----------------------------------------------------------------------
# Create symbolic links
#----------------------------------------------------------------------
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin)

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------
ifeq (, $(wildcard vendor/qcom/build/tasks/generate_extra_images.mk))
include device/qcom/common/generate_extra_images.mk
endif
