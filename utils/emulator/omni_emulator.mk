PRODUCT_COPY_FILES += \
    vendor/invictus/utils/emulator/fstab.ranchu:root/fstab.ranchu

$(call inherit-product, build/target/product/sdk_x86.mk)

$(call inherit-product, vendor/invictus/common.mk)

$(call inherit-product, vendor/invictus/utils/emulator/common.mk)

# Override product naming for Omni
PRODUCT_NAME := omni_emulator

PRODUCT_PACKAGE_OVERLAYS += vendor/invictus/utils/emulator/overlay
