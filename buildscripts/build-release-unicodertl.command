#!/bin/tcsh -efx

# Script to build the github fpc-3.3.1 compiler's unicode rtl
# Script written by Adriaan van Os <adriaan@adriaan.biz)>
# Version 20260725

cd $0:h

setenv XR /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

pushd rtl

sudo make clean FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
make all FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
sudo make install FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl

sudo make clean FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
make all FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
sudo make install FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl

popd

pushd packages

sudo make clean FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
make all FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
sudo make install FPC=/usr/local/lib/fpc/3.3.1/ppca64 CPU_TARGET=aarch64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl

sudo make clean FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
make all FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl
sudo make install FPC=/usr/local/lib/fpc/3.3.1/ppcx64 CPU_TARGET=x86_64 OPT="-XR$XR -dUSEWIDESTRING -O2 -Si" SUB_TARGET=unicodertl

popd
