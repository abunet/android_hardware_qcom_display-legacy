#Common headers
common_includes := hardware/qcom/display-caf/msm7x27a/libgralloc
common_includes += hardware/qcom/display-caf/msm7x27a/libgenlock
common_includes += hardware/qcom/display-caf/msm7x27a/liboverlay
common_includes += hardware/qcom/display-caf/msm7x27a/libcopybit
common_includes += hardware/qcom/display-caf/msm7x27a/libqdutils
common_includes += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

ifeq ($(TARGET_USES_POST_PROCESSING),true)
    common_flags     += -DUSES_POST_PROCESSING
    common_includes += $(TARGET_OUT_HEADERS)/pp/inc
endif


#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers

ifeq ($(TARGET_USES_ION),true)
    common_flags += -DUSE_ION
endif

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

ifeq ($(TARGET_NO_HW_VSYNC),true)
    common_flags += -DNO_HW_VSYNC
endif

#common_deps  :=
#kernel_includes :=
common_deps := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
kernel_includes := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
