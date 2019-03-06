################################################################################
#
# norns
#
################################################################################

NORNS_VERSION = v1.1.2
NORNS_SITE = $(call github,monome,norns,$(NORNS_VERSION))
NORNS_LICENSE = ISC
NORNS_LICENSE_FILES = LICENSE.txt
NORNS_INSTALL_STAGING = YES
NORNS_DEPENDENCIES = avahi cairo libevdev liblo libmonome lua nanomsg supercollider

# TODO temp fix to copy required files to hardcoded locations
# These should be installed to system directories and defined in the wscript

define NORNS_POST_INSTALL_TARGET_USER
  mkdir -p $(TARGET_DIR)/root/norns
  cp -r $(@D)/resources ${TARGET_DIR}/root/norns/resources
  cp -r $(@D)/lua ${TARGET_DIR}/root/norns/lua
endef
NORNS_POST_INSTALL_TARGET_HOOKS += NORNS_POST_INSTALL_TARGET_USER

define NORNS_POST_INSTALL_TARGET_EXTENSIONS
  mkdir -p $(TARGET_DIR)/usr/share/SuperCollider/Extensions
  for file in $$(find $(@D)/sc -name "*.sc"); do \
    cp $${file} $(TARGET_DIR)/usr/share/SuperCollider/Extensions/; \
  done
endef
NORNS_POST_INSTALL_TARGET_HOOKS += NORNS_POST_INSTALL_TARGET_EXTENSIONS

$(eval $(waf-package))
