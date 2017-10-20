PRODUCT_BRAND ?= omni

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/invictus/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/invictus/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/invictus/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
    vendor/invictus/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/invictus/prebuilt/common/bin/sysinit:system/bin/sysinit

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/invictus/prebuilt/common/etc/init.local.rc:root/init.invictus.rc

# userinit support
PRODUCT_COPY_FILES += \
    vendor/invictus/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# custom omni sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=omni_ringtone1.ogg \
    ro.config.notification_sound=omni_notification1.ogg \
    ro.config.alarm_alert=omni_alarm1.ogg

# Additional packages
-include vendor/invictus/utils/emulator/packages.mk

# Versioning
-include vendor/invictus/config/version.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/invictus/overlay/common

# Enable dexpreopt for all nightlies
ifeq ($(ROM_BUILDTYPE),NIGHTLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# and weeklies
ifeq ($(ROM_BUILDTYPE),WEEKLY)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# and security releases
ifeq ($(ROM_BUILDTYPE),SECURITY_RELEASE)
    ifeq ($(WITH_DEXPREOPT),)
        WITH_DEXPREOPT := true
    endif
endif
# but not homemades
#ifeq ($(ROM_BUILDTYPE),HOMEMADE)
#    WITH_DEXPREOPT := false
#endif
