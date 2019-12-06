################################################################################
#
# supercollider
#
################################################################################

SUPERCOLLIDER_VERSION = 3.10.2
SUPERCOLLIDER_SOURCE = SuperCollider-$(SUPERCOLLIDER_VERSION)-Source-linux.tar.bz2
SUPERCOLLIDER_SITE = https://github.com/supercollider/supercollider/releases/download/Version-$(SUPERCOLLIDER_VERSION)
SUPERCOLLIDER_INSTALL_STAGING = YES
SUPERCOLLIDER_LICENSE = GPL-3.0
SUPERCOLLIDER_LICENSE_FILES = COPYING
# For unknown reasons SC is not picking up on readline (or not correctly setting HAVE_READLINE during configure?)
# So forcing that by adding it here
SUPERCOLLIDER_CONF_OPTS = \
  -DHAVE_READLINE=yes \
  -DCMAKE_BUILD_TYPE=Release \
  -DINSTALL_HELP=no \
  -DENABLE_TESTSUITE=no \
  -DNATIVE=no \
  -DSSE=no \
  -DSSE2=no \
  -DBUILD_TESTING=no \
  -DENABLE_TESTSUITE=no \
  -DNO_X11=yes \
  -DLIBSCSYNTH=no \
  -DAUDIOAPI=jack \
  -DSCLANG_SERVER=yes \
  -DSUPERNOVA=yes \
  -DSC_ED=no \
  -DSC_EL=no \
  -DSC_HIDAPI=no \
  -DSC_IDE=no \
  -DSC_QT=no \
  -DSC_VIM=no \
  -DNOVA_SIMD=yes
SUPERCOLLIDER_DEPENDENCIES = avahi fftw-single jack2 libsndfile

$(eval $(cmake-package))
