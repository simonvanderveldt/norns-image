################################################################################
#
# dust
#
################################################################################

DUST_VERSION = 2.0.1
DUST_SOURCE = norns-$(DUST_VERSION)-dust.tgz
DUST_SITE = https://monome.nyc3.digitaloceanspaces.com
DUST_LICENSE = GPL-3.0
DUST_DEPENDENCIES = norns

define DUST_INSTALL_TARGET_CMDS
  mkdir -p $(TARGET_DIR)/root/dust
  cp -a $(@D)/* $(TARGET_DIR)/root/dust
  mkdir -p $(TARGET_DIR)/root/.config/SuperCollider
  cp -a $(DUST_PKGDIR)/sclang_conf.yaml $(TARGET_DIR)/root/.config/SuperCollider/sclang_conf.yaml
endef

$(eval $(generic-package))
