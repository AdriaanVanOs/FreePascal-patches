#!/bin/tcsh -efx

# Script to build the github fpc-3.3.1-llvm compiler's x86_64 unicode rtl
# Script written by Adriaan van Os <adriaan@adriaan.biz)>
# Version 20260725

cd $0:h

# the clang version on the build machine is;
# Apple clang version 15.0.0 (clang-1500.3.9.4)
# Target: arm64-apple-darwin23.6.0
# Thread model: posix
# InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

setenv CLANGOPTION "-Clv15.0 -Clflto -Clfltonosystem"
setenv XR /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

pushd rtl
sudo make clean FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1 INSTALL_PREFIX=/usr/local/lib/fpc/3.3.1-llvm
make all FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1
sudo make install FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1 INSTALL_PREFIX=/usr/local/lib/fpc/3.3.1-llvm
popd

pushd packages
sudo make clean FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1 INSTALL_PREFIX=/usr/local/lib/fpc/3.3.1-llvm
make all FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1
sudo make install FPC=/usr/local/lib/fpc/3.3.1-llvm/ppcx64 CPU_SOURCE=x86_64 OPT="$CLANGOPTION -dUSEWIDESTRING -O3 -Si -Clflto" SUB_TARGET=unicodertl LLVM=1 INSTALL_PREFIX=/usr/local/lib/fpc/3.3.1-llvm
popd

# install the llvm unicodertl stuff into /usr/local/lib/fpc/3.3.1-llvm
# ...
