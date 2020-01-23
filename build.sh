#!/bin/bash

mkdir -p build
pushd build

cmake -GXcode \
  -DCMAKE_SYSTEM_NAME=iOS \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=11 \
  -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" \
  -DQt5_DIR="/path/to/qt5/lib/cmake/Qt5" \
  ..

cmake --build . --config Release

popd