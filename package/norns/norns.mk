################################################################################
#
# norns
#
################################################################################

NORNS_VERSION = v2.0.1
NORNS_SITE = $(call github,monome,norns,$(NORNS_VERSION))
NORNS_LICENSE = ISC
NORNS_LICENSE_FILES = LICENSE.txt
NORNS_INSTALL_STAGING = YES
NORNS_CONF_OPTS = --boost-includes=$(STAGING_DIR)/usr/include --boost-libs $(STAGING_DIR)/usr/lib
NORNS_DEPENDENCIES = avahi boost cairo libevdev liblo libmonome lua nanomsg supercollider

# TODO temp fix to copy required files to hardcoded locations
# These should be installed to system directories and defined in the wscript

define NORNS_POST_INSTALL_TARGET_USER
  mkdir -p $(TARGET_DIR)/root/norns
  cp -a $(@D)/resources ${TARGET_DIR}/root/norns/resources
  cp -a $(@D)/lua ${TARGET_DIR}/root/norns/lua
  mkdir -p $(TARGET_DIR)/root/norns/sc
  cp -a $(@D)/sc/core ${TARGET_DIR}/root/norns/sc/
  cp -a $(@D)/sc/engines ${TARGET_DIR}/root/norns/sc/
  mkdir -p $(TARGET_DIR)/root/norns/sc/ugens
  mkdir -p ${TARGET_DIR}/root/.local/share/SuperCollider/Extensions/
  cp -a $(@D)/sc/norns-config.sc ${TARGET_DIR}/root/.local/share/SuperCollider/Extensions/
endef
NORNS_POST_INSTALL_TARGET_HOOKS += NORNS_POST_INSTALL_TARGET_USER

# define NORNS_POST_INSTALL_TARGET_EXTENSIONS
#   mkdir -p $(TARGET_DIR)/usr/share/SuperCollider/Extensions
#   for file in $$(find $(@D)/sc -name "*.sc"); do \
#     cp $${file} $(TARGET_DIR)/usr/share/SuperCollider/Extensions/; \
#   done
# endef
# NORNS_POST_INSTALL_TARGET_HOOKS += NORNS_POST_INSTALL_TARGET_EXTENSIONS

$(eval $(waf-package))
