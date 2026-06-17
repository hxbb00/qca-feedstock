#!/usr/bin/env bash

[[ ! -d build ]] && mkdir build/
cd build/

# "default" channel "qt" creates "plugins" in root of environment
# Need to put "qca" plugin -- including qca-ossl -- in that folder
cmake ${CMAKE_ARGS} \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=${PREFIX} \
    -D USE_RELATIVE_PATHS=FALSE \
    -D QCA_PLUGINS_INSTALL_DIR=${PREFIX}/lib/qt6/plugins \
    -D CMAKE_PREFIX_PATH=${PREFIX} \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_WITH_QT6=ON \
    -D QCA_SUFFIX=qt6 \
    -D BUILD_TESTS=OFF \
    ${SRC_DIR}

ninja -j${CPU_COUNT}
# No make check
ninja install
