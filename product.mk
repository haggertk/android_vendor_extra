OUR_BUILD=$(subst lineage_,,$(TARGET_PRODUCT))

# Gapps
MINDTHEGAPPS_EMBED_ARM64_PRODUCT := \
    blueline \
    mata

ifneq ($(filter $(MINDTHEGAPPS_EMBED_ARM64_PRODUCT),$(OUR_BUILD)),)
    $(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)
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
