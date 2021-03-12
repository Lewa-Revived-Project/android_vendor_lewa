include vendor/lewa/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lewa/config/BoardConfigQcom.mk
endif

include vendor/lewa/config/BoardConfigSoong.mk
