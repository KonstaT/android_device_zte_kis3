LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),kis3)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
