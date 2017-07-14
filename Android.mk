LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libbrotli
LOCAL_SRC_FILES := \
    common/dictionary.c \
    dec/bit_reader.c \
    dec/decode.c \
    dec/huffman.c \
    dec/state.c \
    enc/backward_references.c \
    enc/backward_references_hq.c \
    enc/bit_cost.c \
    enc/block_splitter.c \
    enc/brotli_bit_stream.c \
    enc/cluster.c \
    enc/compress_fragment.c \
    enc/compress_fragment_two_pass.c \
    enc/dictionary_hash.c \
    enc/encode.c \
    enc/entropy_encode.c \
    enc/histogram.c \
    enc/literal_cost.c \
    enc/memory.c \
    enc/metablock.c \
    enc/static_dict.c \
    enc/utf8_util.c \

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_CFLAGS := -Werror -O2
include $(BUILD_HOST_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := bro
LOCAL_SRC_FILES := tools/bro.c
LOCAL_CFLAGS := -Werror
LOCAL_SHARED_LIBRARIES := libbrotli
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
include $(BUILD_HOST_EXECUTABLE)
