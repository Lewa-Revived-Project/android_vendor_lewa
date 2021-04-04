# Copyright (C) 2018-20 Project dotOS
# Copyright (C) 2021 Lewa-Revived OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Lewa-Revived Version :
LEWA_MOD_VERSION = beta-1.0.0

ifndef LEWA_BUILD_TYPE
    LEWA_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
LEWA_DATE_YEAR := $(shell date -u +%Y)
LEWA_DATE_MONTH := $(shell date -u +%m)
LEWA_DATE_DAY := $(shell date -u +%d)
LEWA_DATE_HOUR := $(shell date -u +%H)
LEWA_DATE_MINUTE := $(shell date -u +%M)
LEWA_BUILD_DATE_UTC := $(shell date -d '$(LEWA_DATE_YEAR)-$(LEWA_DATE_MONTH)-$(LEWA_DATE_DAY) $(LEWA_DATE_HOUR):$(LEWA_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(LEWA_DATE_YEAR)$(LEWA_DATE_MONTH)$(LEWA_DATE_DAY)-$(LEWA_DATE_HOUR)$(LEWA_DATE_MINUTE)

ifeq ($(LEWA_OFFICIAL), true)
    IS_OFFICIAL=true
    LEWA_BUILD_TYPE := OFFICIAL
endif

TARGET_PRODUCT_SHORT := $(subst lewa-revived_,,$(LEWA_BUILD))

LEWA_VERSION := Lewa-Revived-11-$(LEWA_VERSION)-$(CURRENT_DEVICE)-$(LEWA_BUILD_TYPE)-$(CUSTOM_BUILD_DATE)

LEWA_FINGERPRINT := Lewa-Revived-/$(LEWA_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)

PRODUCT_PRODUCT_PROPERTIES += \
  ro.lewa-revived.version=$(LEWA_VERSION) \
  ro.lewa-revived.releasetype=$(LEWA_BUILD_TYPE) \
  ro.modversion=$(LEWA_MOD_VERSION)

LEWA_DISPLAY_VERSION := Lewa-Revived-$(LEWA_VERSION)-$(LEWA_BUILD_TYPE)

PRODUCT_PRODUCT_PROPERTIES += \
  ro.lewa-revived.display.version=$(LEWA_DISPLAY_VERSION)\
  ro.lewa-revived.fingerprint=$(LEWA_FINGERPRINT)

# LineageOS Platform SDK Version
PRODUCT_PRODUCT_PROPERTIES += \
  ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)
