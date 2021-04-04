include vendor/lewa/build/core/lewa_version.mk

# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# Lewa System Version
ADDITIONAL_BUILD_PROPERTIES += \
		ro.lewa-revived.version=$(LEWA_VERSION) \
		ro.lewa-revived.releasetype=$(LEWA_BUILD_TYPE) \
		ro.modversion=$(LEWA_MOD_VERSION) \

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
