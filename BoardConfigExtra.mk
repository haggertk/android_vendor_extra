# SDCLANG
SDCLANG_BLACKLIST := bullhead bullhead4c mata

ifneq ($(filter $(SDCLANG_BLACKLIST),$(TARGET_DEVICE)),)
  TARGET_USE_SDCLANG := false
else
  TARGET_USE_SDCLANG := true
endif

# TWRP
TW_DEVICE_VERSION ?= $(shell date -u +"%Y%m%d_%H%M")-kfh
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := false
