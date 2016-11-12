# kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

TARGET_PREBUILT_KERNEL := $(shell find $(DEVICE_PATH)/kernel 2>/dev/null)

ifeq ($(TARGET_PREBUILT_KERNEL),)
    BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
    TARGET_KERNEL_ARCH := arm64
    TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
    TARGET_KERNEL_CONFIG := cyanogenmod_land_defconfig
    TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8937
else
    BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
endif
