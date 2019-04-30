################################################################################
#
# we
#
################################################################################

WE_VERSION = 34d225b003f2132042324a89bc66ef8e29f1526e
WE_SITE = https://github.com/monome/we.git
WE_SITE_METHOD = git
WE_LICENSE = GPL-3.0
WE_LICENSE_FILES = LICENSE
WE_DEPENDENCIES = dust

define WE_INSTALL_TARGET_CMDS
  rm -rf $(TARGET_DIR)/root/dust/code/we
  cp -a $(WE_DL_DIR)/git $(TARGET_DIR)/root/dust/code/we
endef

$(eval $(generic-package))
