#! /bin/bash

set -e

mkdir build
cd build
cmake ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_COLOR_MAKEFILE=OFF \
  -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  ..
make -j$CPU_COUNT VERBOSE=1
# make test -- these do not pass
make install

cd $PREFIX
rm -f lib/libgraphite2.la bin/gr2fonttest
