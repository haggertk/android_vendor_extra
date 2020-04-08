# Gapps
GAPPS_EMBED_ARM64_PRODUCT := \
    lineage_blueline \
    lineage_mata

ifneq ($(filter $(GAPPS_EMBED_ARM64_PRODUCT),$(TARGET_PRODUCT)),)
    GAPPS_VARIANT := stock
    GAPPS_FORCE_WEBVIEW_OVERRIDES := false
    GAPPS_KEEP_ALT_BROWSERS := true

    $(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif

# ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:$(TARGET_RECOVERY_ROOT_OUT)/root/adb_keys \
    vendor/extra/adb_keys:$(TARGET_ROOT_OUT)/adb_keys
