OUR_BUILD=$(subst lineage_,,$(TARGET_PRODUCT))

# Gapps
MINDTHEGAPPS_EMBED_ARM64_PRODUCT := \
    blueline \
    gta4xl \
    gta4xlwifi \
    mata \
    redfin

ifneq ($(filter $(MINDTHEGAPPS_EMBED_ARM64_PRODUCT),$(OUR_BUILD)),)
    WITH_GMS := true
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

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    root/adb_keys \
    system/bin/ih8sn \
    system/etc/ih8sn.conf \
    system/etc/init/ih8sn.rc
