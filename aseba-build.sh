#!/bin/sh

cd aseba
# pull and compile dashel
cd dashel
git pull origin
cd ..
cd build-dashel
cmake ../dashel -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=ON
make
cd ..
# pull and compile enki
cd enki
git pull origin
cd ..
cd build-enki
cmake ../enki -DCMAKE_BUILD_TYPE=RelWithDebInfo
make
cd ..
# pull and compile aseba, telling it where to find dashel and enki
cd aseba
git pull origin && git checkout release-1.5.x && git submodule update --init && cd ..
cd build-aseba
export dashel_DIR=../build-dashel
cmake ../aseba -DCMAKE_BUILD_TYPE=RelWithDebInfo -Ddashel_DIR=../build-dashel -DDASHEL_INCLUDE_DIR=../dashel -DDASHEL_LIBRARY=../build-dashel/libdashel.so -DENKI_INCLUDE_DIR=../enki -DENKI_LIBRARY=../build-enki/enki/libenki.a -DENKI_VIEWER_LIBRARY=../build-enki/viewer/libenkiviewer.a
make
