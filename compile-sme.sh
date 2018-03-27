#!/bin/bash

chmod 755 src/leveldb/build_detect_platform

sed -i -e 's/DbEnv(0)/DbEnv(0u)/g' src/db.cpp

sed -i -e 's/ -lgdi32/ -lgdi32 -pthread/g' SME-qt.pro


export PATH=/home/ubuntu/mxe/usr/bin:$PATH
MXE_INCLUDE_PATH=/home/ubuntu/mxe/usr/i686-w64-mingw32.static/include
MXE_LIB_PATH=/home/ubuntu/mxe/usr/i686-w64-mingw32.static/lib

i686-w64-mingw32.static-qmake-qt5 \
BOOST_LIB_SUFFIX=-mt \
BOOST_THREAD_LIB_SUFFIX=_win32-mt \
BOOST_INCLUDE_PATH=$MXE_INCLUDE_PATH/boost \
BOOST_LIB_PATH=$MXE_LIB_PATH \
OPENSSL_INCLUDE_PATH=$MXE_INCLUDE_PATH/openssl \
OPENSSL_LIB_PATH=$MXE_LIB_PATH \
BDB_INCLUDE_PATH=$MXE_INCLUDE_PATH \
BDB_LIB_PATH=$MXE_LIB_PATH \
MINIUPNPC_INCLUDE_PATH=$MXE_INCLUDE_PATH \
MINIUPNPC_LIB_PATH=$MXE_LIB_PATH \
QRENCODE_LIB_PATH=$MXE_LIB_PATH \
QRENCODE_INCLUDE_PATH=$MXE_INCLUDE_PATH \
QMAKE_LRELEASE=/home/ubuntu/mxe/usr/i686-w64-mingw32.static/qt5/bin/lrelease "USE_QRCODE=1" SME-qt.pro
 

make -f Makefile.Release


#cp  -f release/toa-qt.exe /media/sf_share/
