OUR_BUILD=$(subst lineage_,,$(TARGET_PRODUCT))

# Gapps
GAPPS_EMBED_ARM64_PRODUCT := \
    lineage_blueline \
    lineage_mata

ifneq ($(filter $(GAPPS_EMBED_ARM64_PRODUCT),$(TARGET_PRODUCT)),)
    GAPPS_VARIANT := full
    GAPPS_FORCE_WEBVIEW_OVERRIDES := false
    GAPPS_KEEP_ALT_BROWSERS := true

    $(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
endif

# ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:$(TARGET_RECOVERY_ROOT_OUT)/root/adb_keys \
    vendor/extra/adb_keys:$(TARGET_ROOT_OUT)/adb_keys

PRODUCT_PACKAGES += ih8sn

ifneq ("$(wildcard  vendor/extra/configs/ih8sn/ih8sn_$(OUR_BUILD).conf)","")
    PRODUCT_COPY_FILES += \
        vendor/extra/configs/ih8sn/ih8sn_$(OUR_BUILD).conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf
else
    PRODUCT_COPY_FILES += \
        vendor/extra/configs/ih8sn/ih8sn_generic.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf
endif
