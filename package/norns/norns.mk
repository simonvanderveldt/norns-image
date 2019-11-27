################################################################################
#
# norns
#
################################################################################

NORNS_VERSION = v2.2.2
NORNS_SITE = $(call github,monome,norns,$(NORNS_VERSION))
NORNS_LICENSE = ISC
NORNS_LICENSE_FILES = LICENSE.txt
NORNS_INSTALL_STAGING = YES
NORNS_CONF_OPTS = --boost-includes=$(STAGING_DIR)/usr/include --boost-libs $(STAGING_DIR)/usr/lib --supercollider-prefix $(STAGING_DIR)/usr
NORNS_DEPENDENCIES = avahi boost cairo libevdev liblo libmonome lua nanomsg supercollider

$(eval $(waf-package))
