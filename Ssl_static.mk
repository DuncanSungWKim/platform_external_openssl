LOCAL_PATH := $(call my-dir)

local_c_flags :=

local_c_includes := $(log_c_includes)

local_additional_dependencies := $(LOCAL_PATH)/Ssl_static.mk

include $(LOCAL_PATH)/Ssl-config.mk

#######################################
# target static library
include $(CLEAR_VARS)

# If we're building an unbundled build, don't try to use clang since it's not
# in the NDK yet. This can be removed when a clang version that is fast enough
# in the NDK.
ifeq (,$(TARGET_BUILD_APPS))
LOCAL_CLANG := true
else
LOCAL_SDK_VERSION := 9
endif

LOCAL_SRC_FILES += $(target_src_files)
LOCAL_CFLAGS += $(target_c_flags)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/crypto
LOCAL_SHARED_LIBRARIES = $(log_shared_libraries)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libssl_static
LOCAL_ADDITIONAL_DEPENDENCIES := $(local_additional_dependencies)
include $(BUILD_STATIC_LIBRARY)
