# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(BOARD_USES_STE_HARDWARE), true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_SRC_FILES := display/b2r2lib/src/blt_b2r2.c
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/display/b2r2lib/include
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libblt_hw
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libomxil-bellagio
LOCAL_MODULE_TAGS := optional
SRC := media/libomxil-bellagio/src
BASE := media/libomxil-bellagio/src/base
LOCAL_SRC_FILES := \
   $(SRC)/st_static_component_loader.c \
   $(SRC)/omxcore.c \
   $(SRC)/omx_create_loaders_linux.c \
   $(SRC)/tsemaphore.c \
   $(SRC)/queue.c \
   $(SRC)/utils.c \
   $(SRC)/common.c \
   $(SRC)/content_pipe_inet.c \
   $(SRC)/content_pipe_file.c \
   $(SRC)/omx_reference_resource_manager.c \
   $(SRC)/getline.c \
   $(BASE)/omx_base_component.c \
   $(BASE)/omx_base_port.c \
   $(BASE)/omx_base_filter.c \
   $(BASE)/omx_base_sink.c \
   $(BASE)/omx_base_source.c \
   $(BASE)/omx_base_audio_port.c \
   $(BASE)/omx_base_video_port.c \
   $(BASE)/omx_base_image_port.c \
   $(BASE)/omx_base_clock_port.c \
   $(BASE)/OMXComponentRMExt.c

LOCAL_C_INCLUDES := \
   $(LOCAL_PATH)/media/libomxil-bellagio/include \
   $(LOCAL_PATH)/$(BASE) \
   $(LOCAL_PATH)/$(SRC)

LOCAL_CFLAGS += -DRELEASE -D__RELEASE
LOCAL_SHARED_LIBRARIES := \
   libdl \
   liblog

include $(BUILD_SHARED_LIBRARY)

#
# Copyright (C) 2012 Google, inc.
#
# $Id: Android.mk,v 2.6 2009-05-07 18:25:15 hharte Exp $
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#
# lib_net_iface_cmd
#
include $(CLEAR_VARS)
SRC := network/bcmdhd_net_iface
LOCAL_SRC_FILES := \
    ${SRC}/bcmdhd_net_iface.c
LOCAL_MODULE := libnetcmdiface
LOCAL_CFLAGS := -mabi=aapcs-linux
LOCAL_MODULE_TAGS := optional
LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_SHARED_LIBRARY)


# iw
#
include $(CLEAR_VARS)
SRC := network/iw_util
NO_PKG_CONFIG=y
LOCAL_SRC_FILES := \
    ${SRC}/bitrate.c \
    ${SRC}/coalesce.c \
    ${SRC}/connect.c \
    ${SRC}/cqm.c \
    ${SRC}/event.c \
    ${SRC}/genl.c \
    ${SRC}/hwsim.c \
    ${SRC}/ibss.c \
    ${SRC}/info.c \
    ${SRC}/interface.c \
    ${SRC}/iw.c \
    ${SRC}/link.c \
    ${SRC}/mesh.c \
    ${SRC}/mpath.c \
    ${SRC}/offch.c \
    ${SRC}/p2p.c \
    ${SRC}/phy.c \
    ${SRC}/ps.c \
    ${SRC}/reason.c \
    ${SRC}/reg.c \
    ${SRC}/roc.c \
    ${SRC}/scan.c \
    ${SRC}/sections.c \
    ${SRC}/station.c \
    ${SRC}/status.c \
    ${SRC}/survey.c \
    ${SRC}/util.c \
    ${SRC}/wowlan.c \
    ${SRC}/version.c \
    ${SRC}/android-nl.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/wifi/iw_util \
	external/libnl-headers

LOCAL_CFLAGS := -O2 -g -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
LOCAL_CFLAGS += -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -DCONFIG_LIBNL20
LOCAL_LDFLAGS := -Wl,--no-gc-sections
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_LIBRARIES := libnl_2 libc libstdc++ libm
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE:=iw
include $(BUILD_EXECUTABLE)

# copybit
#

# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)
MULTIMEDIA_PATH := $(LOCAL_PATH)/../multimedia
GRALLOC_PATH := $(LOCAL_PATH)/../../libgralloc
LOCAL_C_INCLUDES := $(MULTIMEDIA_PATH)/linux/b2r2lib/include $(GRALLOC_PATH)
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libblt_hw libhardware
SRC := display/libcopybit
LOCAL_SRC_FILES := ${SRC}/copybit.c
LOCAL_MODULE := copybit.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)


# gralloc
#

MULTIMEDIA_PATH := $(LOCAL_PATH)/../../multimedia

# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libGLESv1_CM
SRC := display/libgralloc
LOCAL_SRC_FILES := 	\
	${SRC}/hwmem_gralloc.c \
        ${SRC}/hwmem_gralloc_pmem.c \
        ${SRC}/hwmem_gralloc_framebuffer.c

LOCAL_C_INCLUDES += $(MULTIMEDIA_PATH)/linux/b2r2lib/include $(MULTIMEDIA_PATH)
LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS:= -DLOG_TAG=\"gralloc\"
include $(BUILD_SHARED_LIBRARY)

# audio hal
#

A2DP_USES_STANDARD_ANDROID_PATH := true

MULTIMEDIA_PATH := $(LOCAL_PATH)/../../multimedia

$(shell mkdir -p $(TARGET_OUT_INTERMEDIATES)/SHARED_LIBRARIES/libste_adm_intermediates)
$(shell touch $(TARGET_OUT_INTERMEDIATES)/SHARED_LIBRARIES/libste_adm_intermediates/export_includes)

SRC_FOLDER_AHI := audio/ld_anm/src/ahi
SRC_FOLDER_DBG := audio/ld_anm/src
SRC_FILES_ANM := \
	$(SRC_FOLDER_AHI)/ste_anm_ahi.cc \
	$(SRC_FOLDER_AHI)/ste_anm_ahi_output.cc \
	$(SRC_FOLDER_AHI)/ste_anm_ahi_input.cc \
	$(SRC_FOLDER_AHI)/ste_anm_ahi_admbase.cc \
	$(SRC_FOLDER_DBG)/ste_anm_dbg.cc

SRC_FOLDER_AP := audio/ld_anm/src/policy

SRC_FILES_AP := \
	$(SRC_FOLDER_AP)/ste_anm_ap.cc \
    $(SRC_FOLDER_DBG)/ste_anm_dbg.cc

CFLAGS_COMMON_ANM := -DLOG_WARNINGS \
	-DLOG_ERRORS \
    -DSTE_VIDEO_CALL \
	-D_POSIX_SOURCE \
	-DUSE_CACHE_MECHANISM \
	-DALLOW_DUPLICATION

ifeq ($(A2DP_USES_STANDARD_ANDROID_PATH),true)
CFLAGS_COMMON_ANM += -DSTD_A2DP_MNGT
endif

EXTERNAL_INCLUDES_ANM := \
	$(MULTIMEDIA_PATH)/audio/adm/include \
	$(MULTIMEDIA_PATH)/shared/utils/include \
	hardware/libhardware/include \
	$(call include-path-for, audio-effects)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
	libste_adm \
	libcutils \
	libstelpcutils \
	libutils \
	libmedia \
	libdl \
	libc

LOCAL_SRC_FILES := $(SRC_FILES_AP)

LOCAL_CFLAGS += $(CFLAGS_COMMON_ANM)
ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_CFLAGS += -DWITH_BLUETOOTH -DWITH_A2DP
endif

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \
	$(EXTERNAL_INCLUDES_ANM)

LOCAL_STATIC_LIBRARIES := \
	libmedia_helper

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := audio.primary.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := \
	libste_adm \
	libcutils \
	libstelpcutils \
	libutils \
	libmedia \
	libhardware \
	liblog \
	libasound \
	libdl

LOCAL_SRC_FILES += \
	$(SRC_FILES_ANM)

LOCAL_CFLAGS += \
	$(CFLAGS_COMMON_ANM) \

LOCAL_C_INCLUDES += \
	$(EXTERNAL_INCLUDES_ANM) \
	$(LOCAL_PATH)/include

LOCAL_STATIC_LIBRARIES += \
	libmedia_helper

include $(BUILD_SHARED_LIBRARY)

################################################################################
#
# libste_adm.so
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES :=  \
        audio/adm/src/api/cscall/ste_adm_api_cscall.c \
        audio/adm/src/api/cscall/ste_adm_cscall_omx.c \
        audio/adm/src/api/cscall/ste_adm_api_modem.c \
        audio/adm/src/api/ste_adm_api_d2d.c \
        audio/adm/src/api/ste_adm_api_devset.c \
        audio/adm/src/api/ste_adm_api_util.c \
        audio/adm/src/db/ste_adm_db.c \
        audio/adm/src/db/ste_adm_db_remap_check.c \
        audio/adm/src/db/ste_adm_db_cfg.c \
        audio/adm/src/db/ste_adm_db_test.c \
        audio/adm/src/dev/ste_adm_dev.c \
        audio/adm/src/dev/ste_adm_dev_omx.c \
        audio/adm/src/dev/ste_adm_dev_omx_graph.c \
        audio/adm/src/dev/ste_adm_dev_omx_util.c \
        audio/adm/src/il_tool/ste_adm_omx_io.c \
        audio/adm/src/il_tool/ste_adm_omx_log.c \
        audio/adm/src/il_tool/ste_adm_omx_tool.c \
        audio/adm/src/il_tool/ste_adm_omx_core.c \
        audio/adm/src/il_tool/ste_adm_platform_adaptions.c \
        audio/adm/src/ste_adm_client.c \
        audio/adm/src/ste_adm_dbg.c \
        audio/adm/src/ste_adm_srv.c \
        audio/adm/src/ste_adm_main.c \
        audio/adm/src/ste_adm_util.c \
        audio/adm/src/api/ste_adm_api_tg.cpp

LOCAL_CFLAGS += -fvisibility=hidden
LOCAL_CFLAGS += -D_POSIX_C_SOURCE
LOCAL_CFLAGS += -O3 -Wall -funwind-tables
LOCAL_CFLAGS += -DADM_SOCKET_UID=1005
LOCAL_CFLAGS += -DADM_SOCKET_GID=1005
LOCAL_CFLAGS += -DADM_SOCKET_MODE=0660
LOCAL_CFLAGS += -DADM_LOG_WARNINGS -DADM_LOG_ERRORS -DADM_LOG_STATUS
LOCAL_CFLAGS += -DADM_SRC_MODE -DSRC_MODE_INTERNAL

ifeq ($(ADM_DISABLE_FEATURE_CSCALL),true)
LOCAL_CFLAGS += -DADM_EXCLUDE_CSCALL
endif

ifeq ($(MMPROBE_ENABLE_FEATURE_MMPROBE),true)
LOCAL_CFLAGS += -DADM_MMPROBE
endif

ifeq ($(ADM_NO_EFFECT_CONFIG_SUPPORT), 1)
  LOCAL_CFLAGS += -DADM_NO_EFFECT_CONFIG_SUPPORT
endif

ifeq ($(ADM_DISABLE_TONEGEN), 1)
  LOCAL_CFLAGS += -DADM_DISABLE_TONEGEN
endif

ifeq ($(ADM_BUILD_PROD_SPEC),1)
  LOCAL_CFLAGS += -DADM_DB_PROD_SPEC
endif

ifeq ($(ADM_DEBUG), 1)
  LOCAL_CFLAGS += -DADM_DEBUG
endif

LOCAL_MODULE           := libste_adm
LOCAL_MODULE_TAGS      := optional
LOCAL_PRELINK_MODULE   := false

LOCAL_SHARED_LIBRARIES := \
        libcutils \
        libstelpcutils \
        libutils \
        libdl \
        libc \
        libste_ens_audio_samplerateconv \
        libsqlite \
        libmedia \
        libste_audio_mixer \
        libhardware_legacy \
        libomxil-bellagio \


ifeq ($(MMPROBE_ENABLE_FEATURE_MMPROBE),true)
LOCAL_SHARED_LIBRARIES += \
        libmmprobe
endif

LOCAL_C_INCLUDES += \
        $(LOCAL_PATH)/include \
        $(LOCAL_PATH)/src/il_tool \
        $(LOCAL_PATH)/src/ \
        $(LOCAL_PATH)/src/db \
        $(LOCAL_PATH)/src/dev \
        $(LOCAL_PATH)/src/api \
        $(LOCAL_PATH)/src/api/cscall \
        $(TOP)/external/sqlite/dist/  \
        $(TOP)/external/tinyalsa/include/ \
        $(TOP)/external/dbus/ \
        $(TOP)/external/libat/ \
        $(STE_MM_C_INCLUDES) \
        $(MULTIMEDIA_PATH)/audio/mmprobe/api \
        $(APPS_PATH)/caif_socket_broker/lib \
        $(APPS_PATH)/caif_socket_broker/integration

LOCAL_CFLAGS += -DSTE_PLATFORM_U8500

LOCAL_SHARED_LIBRARIES += \
        libalsactrl

LOCAL_C_INCLUDES += \
        $(MULTIMEDIA_PATH)/audio/alsactrl/include

endif
include $(BUILD_SHARED_LIBRARY)

# libstelpcutils
#


include $(CLEAR_VARS)

SRC := media/libstelpcutils
LOCAL_SRC_FILES := \
   stelp_log.c \
   stelp_fatal.c \
   stelp_time.c \
   OMXdebug.cpp \
   OMXdebug_specific.c

LOCAL_LDLIBS := -llog -lpthread -lrt 
LOCAL_CFLAGS += -DFREQ_SCALING_ALLOWED -DANDROID

LOCAL_MODULE:= libstelpcutils
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false

LOCAL_SHARED_LIBRARIES:= \
	libutils \
	libcutils \
	liblog

MULTIMEDIA_PATH := $(LOCAL_PATH)/../../multimedia

LOCAL_C_INCLUDES += \
	$(TOP)/hardware/libhardware/include  \
	$(TOP)/frameworks/native/include/media/hardware \
	$(TOP)/frameworks/native/include \
	$(MULTIMEDIA_PATH)/shared/utils/include \
	$(MULTIMEDIA_PATH)/shared/omxilosalservices_api \
	$(MULTIMEDIA_PATH)/shared/ens_interface/nmf/common \
	$(MULTIMEDIA_PATH)/shared/ens_interface/include \
	$(MULTIMEDIA_PATH)/shared/ens_interface/omxil \
	$(MULTIMEDIA_PATH)/shared/omxil \
	$(MULTIMEDIA_PATH)/linux/trace/api \
	$(MULTIMEDIA_PATH)/audio/drc/proxy \
	$(MULTIMEDIA_PATH)/audio/afm/proxy/include \
	$(MULTIMEDIA_PATH)/audio/audio_chipset_apis \
	$(MULTIMEDIA_PATH)/audio/speech_proc_vcs/wrapper/inc \
	$(MULTIMEDIA_PATH)/video/video_chipset_apis \
	$(MULTIMEDIA_PATH)/video/vfm/include \
	$(MULTIMEDIA_PATH)/audio/comfortnoise/proxy \
	$(MULTIMEDIA_PATH)/shared/ste_shai/include \
	$(LOCAL_PATH)/../../

include $(BUILD_SHARED_LIBRARY)

# libalsactrl
#

include $(CLEAR_VARS)

SRC := audio/libalsactrl
LOCAL_SRC_FILES :=  \
        alsactrl_alsa.c \
        alsactrl_fm.c \
        alsactrl_audiocodec.c \
        alsactrl_debug.c \
        alsactrl_hwh.c \
        alsactrl_hwh_db.c \
        alsactrl_hwh_u85xx.c \
        alsactrl_statefile_parser.c \
        alsactrl_tinyalsa_extn.c \
        alsactrl_hwh_u8500.c \
        alsactrl_hwh_u8500_dev.c \
        alsactrl_hwh_u8500_d2d.c \
        alsactrl_hwh_u8500_vc.c \
        alsactrl_hwh_u8540.c \
        alsactrl_hwh_u8540_dev.c \
        alsactrl_hwh_u8540_d2d.c \
        alsactrl_hwh_u8540_vc.c \
        alsactrl_cscall.c

LOCAL_CFLAGS += -D_POSIX_C_SOURCE
LOCAL_CFLAGS += -O3 -Wall -funwind-tables
LOCAL_CFLAGS += -DALSACTRL_LOG_ERRORS -DADM_LOG_WARNINGS

LOCAL_MODULE           := libalsactrl
LOCAL_MODULE_TAGS      := optional
LOCAL_PRELINK_MODULE   := false

LOCAL_SHARED_LIBRARIES := \
        libcutils \
        libutils \
        libdl \
        libc \
        libsqlite \
        libtinyalsa

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/ \
    $(TOP)/external/sqlite/dist/

include $(BUILD_SHARED_LIBRARY)

endif # BOARD_USES_STE_HARDWARE
