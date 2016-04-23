LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := healthd_board_kis3.cpp
LOCAL_MODULE := libhealthd.kis3
LOCAL_C_INCLUDES := \
    system/core/healthd \
    bootable/recovery

include $(BUILD_STATIC_LIBRARY)
