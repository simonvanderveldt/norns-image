################################################################################
#
# libmonome
#
################################################################################

LIBMONOME_VERSION = v1.4.1
LIBMONOME_SITE = $(call github,monome,libmonome,$(LIBMONOME_VERSION))
LIBMONOME_DEPENDENCIES = liblo
LIBMONOME_INSTALL_STAGING = YES
LIBMONOME_INSTALL_TARGET = YES
LIBMONOME_INSTALL_IMAGES = YES
LIBMONOME_LICENSE = ISC
LIBMONOME_CONF_OPTS = \
	--libdir=/usr/local/lib ;

$(eval $(waf-package))
