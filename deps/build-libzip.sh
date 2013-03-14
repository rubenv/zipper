#!/bin/bash

cd deps/libzip-$1/
./configure --disable-dependency-tracking --enable-static --disable-shared
make
