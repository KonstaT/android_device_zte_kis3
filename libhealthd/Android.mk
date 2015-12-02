LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := healthd_board_default.cpp
LOCAL_MODULE := libhealthd.qcom
LOCAL_C_INCLUDES := system/core/healthd

include $(BUILD_STATIC_LIBRARY)
