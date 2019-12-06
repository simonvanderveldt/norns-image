################################################################################
#
# sc3_plugins
#
################################################################################

SC3_PLUGINS_VERSION = Version-3.10.0
SC3_PLUGINS_SITE = https://github.com/supercollider/sc3-plugins.git
SC3_PLUGINS_SITE_METHOD=git
SC3_PLUGINS_GIT_SUBMODULES=yes
SC3_PLUGINS_LICENSE = GPL-2.0
SC3_PLUGINS_LICENSE_FILES = license.txt
SC3_PLUGINS_CONF_OPTS = \
  -DSC_PATH=$(STAGING_DIR)/usr/include/SuperCollider/ \
  -DNOVA_SIMD=ON \
  -DNATIVE=OFF \
  -DSUPERNOVA=ON
SC3_PLUGINS_DEPENDENCIES = supercollider fftw-single

$(eval $(cmake-package))
