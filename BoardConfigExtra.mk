# Partitions
TARGET_USES_MKE2FS := true

# SDCLANG
TARGET_USE_SDCLANG := false

# TWRP
TW_DEVICE_VERSION ?= $(shell date -u +"%Y%m%d_%H%M")-kfh
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
