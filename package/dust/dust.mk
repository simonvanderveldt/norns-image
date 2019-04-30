################################################################################
#
# dust
#
################################################################################

DUST_VERSION = c10c62c24e88d1dc10c5eb3ed77f5b9b451fbe6c
DUST_SITE = $(call github,monome,dust,$(DUST_VERSION))
DUST_LICENSE = GPL-3.0
DUST_LICENSE_FILES = LICENSE
DUST_DEPENDENCIES = norns

define DUST_INSTALL_TARGET_CMDS
  mkdir -p $(TARGET_DIR)/root/dust
  cp -a $(@D)/audio $(TARGET_DIR)/root/dust/audio
  mkdir -p $(TARGET_DIR)/root/dust/data
  mkdir -p $(TARGET_DIR)/root/dust/code
endef

$(eval $(generic-package))
