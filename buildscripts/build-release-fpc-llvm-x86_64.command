#!/bin/tcsh -efx

# Script to build the github fpc-3.3.1-llvm x86_64 compiler
# Script written by Adriaan van Os <adriaan@adriaan.biz)>
# Version 20260725

cd $0:h

# the clang version on the build machine is;
# Apple clang version 15.0.0 (clang-1500.3.9.4)
# Target: arm64-apple-darwin23.6.0
# Thread model: posix
# InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin

setenv CLANGOPTION "-Clv15.0 -Clflto -Clfltonosystem"
# setenv CLANGOPTION "-Clv15.0"
setenv XR /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

sudo make clean CPU_SOURCE=x86_64 LLVM=1
make all CPU_SOURCE=x86_64 FPC=/usr/local/lib/fpc/3.2.2/ppcx64 LLVM=1 OPTNEW="$CLANGOPTION -XR$XR" FPCMAKEOPT="$CLANGOPTION -XR$XR -Clflto" OPT="-XR$XR"
sudo make install CPU_SOURCE=x86_64 FPC=/usr/local/lib/fpc/3.2.2/ppcx64 LLVM=1 OPTNEW="$CLANGOPTION -XR$XR" FPCMAKEOPT="$CLANGOPTION -XR$XR -Clflto" OPT="-XR$XR" INSTALL_PREFIX=/usr/local/lib/fpc/3.3.1-llvm

# install the llvm stuff into /usr/local/lib/fpc/3.3.1-llvm
sudo cp -f  /usr/local/lib/fpc/3.3.1-llvm/lib/fpc/3.3.1/ppcx64 /usr/local/lib/fpc/3.3.1-llvm/
sudo cp -f  /usr/local/lib/fpc/3.3.1-llvm/lib/fpc/3.3.1/samplecfg /usr/local/lib/fpc/3.3.1-llvm/
sudo mkdir -p /usr/local/lib/fpc/3.3.1-llvm/fpmkinst
sudo cp -Rf /usr/local/lib/fpc/3.3.1-llvm/lib/fpc/3.3.1/fpmkinst/x86_64-darwin /usr/local/lib/fpc/3.3.1-llvm/fpmkinst/
sudo mkdir -p /usr/local/lib/fpc/3.3.1-llvm/units
sudo cp -Rf /usr/local/lib/fpc/3.3.1-llvm/lib/fpc/3.3.1/units/x86_64-darwin /usr/local/lib/fpc/3.3.1-llvm/units/
sudo cp -Rf /usr/local/lib/fpc/3.3.1-llvm/lib/fpc/3.3.1/msg /usr/local/lib/fpc/3.3.1-llvm/
sudo rm -Rf /usr/local/lib/fpc/3.3.1-llvm/lib
sudo rm -Rf /usr/local/lib/fpc/3.3.1-llvm/share
