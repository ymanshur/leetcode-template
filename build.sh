#!/usr/bin/env bash

#
# Build project
#
cmake \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_MAKE_PROGRAM=ninja \
  -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ \
  -G Ninja -S ./ -B ./cmake-build-debug
