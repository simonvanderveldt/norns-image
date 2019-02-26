################################################################################
#
# supercollider
#
################################################################################

SUPERCOLLIDER_VERSION = 3.9.3
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
  -DAUDIOAPI=jack \
  -DSUPERNOVA=yes \
  -DSCLANG_SERVER=yes \
  -DSC_QT=no \
  -DSSE=no \
  -DSSE2=no \
  -DSC_IDE=no \
  -DSC_ED=no \
  -DSC_VIM=no \
  -DSC_EL=no \
  -DINSTALL_HELP=no \
  -DENABLE_TESTSUITE=no \
  -DNATIVE=no \
  -DSC_HIDAPI=no \
  -DSC_WII=no \
  -DBUILD_TESTING=no \
  -DNOVA_SIMD=yes
SUPERCOLLIDER_DEPENDENCIES = jack2 fftw libsndfile xlib_libX11 xlib_libXt

$(eval $(cmake-package))
