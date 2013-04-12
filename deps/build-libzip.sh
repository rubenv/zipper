#!/bin/bash

cd deps/libzip-$1/
CFLAGS='-fPIC -O3 -DNDEBUG -Wall' ./configure --disable-dependency-tracking --enable-static --disable-shared
make
