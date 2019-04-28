################################################################################
#
# libmonome
#
################################################################################

LIBMONOME_VERSION = v1.4.2
LIBMONOME_SITE = $(call github,monome,libmonome,$(LIBMONOME_VERSION))
LIBMONOME_INSTALL_STAGING = YES
LIBMONOME_LICENSE = ISC
LIBMONOME_LICENSE_FILES = COPYRIGHT
LIBMONOME_CONF_OPTS = \
	--disable-osc ;

$(eval $(waf-package))
