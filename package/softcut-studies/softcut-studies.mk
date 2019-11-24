################################################################################
#
# softcut-studies
#
################################################################################

SOFTCUT_STUDIES_VERSION = 2ac7a4e683ea274d9831b300e81248ac79c6c8c9
SOFTCUT_STUDIES_SITE = $(call github,monome,softcut-studies,$(SOFTCUT_STUDIES_VERSION))
SOFTCUT_STUDIES_DEPENDENCIES = dust

define SOFTCUT_STUDIES_INSTALL_TARGET_CMDS
  rm -rf $(TARGET_DIR)/root/dust/code/softcut-studies
  mkdir $(TARGET_DIR)/root/dust/code/softcut-studies
  cp -a $(@D)/* $(TARGET_DIR)/root/dust/code/softcut-studies/
endef

$(eval $(generic-package))
