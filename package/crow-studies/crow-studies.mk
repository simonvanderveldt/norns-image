################################################################################
#
# crow-studies
#
################################################################################

CROW_STUDIES_VERSION = 6289641b3c22b602fa171a546df820701364c0c5
CROW_STUDIES_SITE = $(call github,monome,crow-studies,$(CROW_STUDIES_VERSION))
CROW_STUDIES_DEPENDENCIES = dust

define CROW_STUDIES_INSTALL_TARGET_CMDS
  rm -rf $(TARGET_DIR)/root/dust/code/crow-studies
  cp -a $(CROW_STUDIES_DL_DIR) $(TARGET_DIR)/root/dust/code/crow-studies
endef

$(eval $(generic-package))
