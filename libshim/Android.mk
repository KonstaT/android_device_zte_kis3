LOCAL_PATH := $(call my-dir)

# libqc-opt
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     icu4c.c

LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_qc-opt
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

# rmt_storage
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
     ioprio.c

LOCAL_MODULE := libshim_rmt_storage
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
