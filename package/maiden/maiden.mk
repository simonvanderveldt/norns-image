################################################################################
#
# maiden
#
################################################################################

MAIDEN_VERSION = v1.0
MAIDEN_SOURCE = maiden-$(MAIDEN_VERSION).tgz
MAIDEN_SITE = https://github.com/monome/maiden/releases/download/$(MAIDEN_VERSION)
MAIDEN_LICENSE = GPL-3.0
MAIDEN_DEPENDENCIES = dust

define MAIDEN_INSTALL_TARGET_CMDS
  # Binary
	cp -a $(@D)/maiden $(TARGET_DIR)/usr/bin/
	# Web resources (html, assets)
	mkdir -p $(TARGET_DIR)/usr/share/maiden
	cp -a $(@D)/app/build/* $(TARGET_DIR)/usr/share/maiden
	# Config
	cp -a $(@D)/maiden.yaml $(TARGET_DIR)/etc/
	mkdir -p $(TARGET_DIR)/root/dust/data/catalogs
	mkdir -p $(TARGET_DIR)/root/dust/data/sources
	cp -a $(@D)/dist/sources/*.json $(TARGET_DIR)/root/dust/data/sources/
endef

$(eval $(generic-package))
