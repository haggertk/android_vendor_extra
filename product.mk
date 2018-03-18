# Gapps
GAPPS_EMBED_ARM64_PRODUCT := lineage_mata

ifneq ($(filter $(GAPPS_EMBED_ARM64_PRODUCT),$(TARGET_PRODUCT)),)
  -include vendor/gapps/arm64/arm64-vendor.mk
endif
