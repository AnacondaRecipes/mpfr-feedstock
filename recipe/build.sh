#!/bin/bash

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* .

export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH

./configure --prefix=$PREFIX \
            --with-gmp=$PREFIX \
            --enable-static
make
make check
make install
