#
# Powered by tapy.me/weikton
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := bass
LOCAL_SRC_FILES := build/bass/libs/armeabi-v7a/libbass.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := samp
LOCAL_LDLIBS := -llog
LOCAL_C_INCLUDES += $(LOCAL_PATH)/build/bass/c
LOCAL_SHARED_LIBRARIES := bass

# samp
FILE_LIST := $(wildcard $(LOCAL_PATH)/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/java/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/game/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/net/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/util/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/game/RW/RenderWare.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/gui/*.cpp)

# weikton
FILE_LIST += $(wildcard $(LOCAL_PATH)/weiktongames/*.cpp)

# vendor
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/inih/cpp/INIReader.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/inih/ini.c)
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/RakNet/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/RakNet/SAMP/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/imgui/*.cpp)
FILE_LIST += $(wildcard $(LOCAL_PATH)/vendor/hash/md5.cpp)

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)

LOCAL_CPPFLAGS := -w -s -fvisibility=default -pthread -Wall -fpack-struct=1 -O2 -std=c++14 -fexceptions
include $(BUILD_SHARED_LIBRARY)