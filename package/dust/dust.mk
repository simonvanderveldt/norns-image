################################################################################
#
# dust
#
################################################################################

DUST_VERSION = a6c183ab927343604f593e5042b8aef26cad3c34
DUST_SITE = $(call github,monome,dust,$(DUST_VERSION))
DUST_LICENSE = GPL-3.0
DUST_LICENSE_FILES = LICENSE

define DUST_INSTALL_TARGET_CMDS
  cp -a $(@D) $(TARGET_DIR)/root/dust
  mkdir -p $(TARGET_DIR)/usr/share/SuperCollider/Extensions
  for file in $$(find $(@D)/lib/sc -name "*.sc"); do \
    cp $${file} $(TARGET_DIR)/usr/share/SuperCollider/Extensions/; \
  done
endef

$(eval $(generic-package))
