#!/bin/tcsh -efx

# Script to build the github foc-3.3.1 compiler from sources
# Script written by Adriaan van Os <adriaan@adriaan.biz)>
# Version 20260725

cd $0:h

setenv XR /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
setenv DBG '-g-'

# must use the fpcmake of the building compiler
# or, better, commit the Makefile changes and don't remake in the final build script
# setenv FPCMAKETOOL /usr/local/lib/fpc/fpc320/utils/fpcm/fpcmake
setenv FPCMAKETOOL /usr/local/bin/fpcmake

pushd rtl/darwin
$FPCMAKETOOL -w -Tall -x ../inc/Makefile.rtl
popd
pushd packages
$FPCMAKETOOL -w -Tall
popd
$FPCMAKETOOL -w -Tall

# note that we have to build for x86_64 last, to prevent that the tools in /usr/local/bin
# will have arm64 code and thus cannot run on Intel cpu Macs.

sudo make distclean CPU_TARGET=aarch64 FPC="/usr/local/lib/fpc/3.2.2/ppca64" OPT="-XR$XR $DBG"
make all CPU_TARGET=aarch64 FPC="/usr/local/lib/fpc/3.2.2/ppca64" OPT="-XR$XR $DBG"
sudo make install CPU_TARGET=aarch64 FPC="/usr/local/lib/fpc/3.2.2/ppca64" OPT="-XR$XR $DBG"

sudo make distclean CPU_TARGET=x86_64 FPC="/usr/local/lib/fpc/3.2.2/ppcx64" OPT="-XR$XR $DBG"
make all CPU_TARGET=x86_64 FPC="/usr/local/lib/fpc/3.2.2/ppcx64" OPT="-XR$XR $DBG"
sudo make install CPU_TARGET=x86_64 FPC="/usr/local/lib/fpc/3.2.2/ppcx64" OPT="-XR$XR $DBG"

# Big Brother is watching you
sudo xattr -r -d  com.apple.quarantine /usr/local/lib/fpc/3.3.1/samplecfg
