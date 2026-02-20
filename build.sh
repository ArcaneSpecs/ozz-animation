#!/bin/bash
set -euo pipefail

pushd "$(dirname "$0")/" > /dev/null

ROOT=$(pwd)

if [ ! -d fbx ]; then
	mkdir -p fbx
	cd fbx
	wget https://damassets.autodesk.net/content/dam/autodesk/www/files/fbx202039_fbxsdk_gcc_linux.tar.gz
	tar xvf fbx202039_fbxsdk_gcc_linux.tar.gz
	./fbx202039_fbxsdk_linux
	rm *.tar.gz*
	rm fbx202039_fbxsdk_linux
	cd $ROOT
fi

echo "root: $ROOT"
mkdir -p build
cd build 
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug -Dozz_build_tests=OFF -Dozz_build_fbx=ON -DFBX_INCLUDE_DIR=$ROOT/fbx -DFBX_LIB=$ROOT/fbx -DFBX_LIB=$ROOT/fbx/lib/debug/libfbxsdk.so -DFBX_LIB_DEBUG=$ROOT/fbx/lib/debug/libfbxsdk.so
make -j32
# make fbx2ozz

popd > /dev/null

