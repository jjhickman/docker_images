#!/bin/bash
cd /tmp/opencv/build
if [[ $PLATFORM == *"arm"* ]] ; then
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D BUILD_SHARED_LIBS=OFF \
        -D ENABLE_CCACHE=OFF \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D BUILD_JAVA=OFF \
        -D ENABLE_NEON=ON \
        -D BUILD_opencv_gpu=OFF \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D BUILD_opencv_python3=TRUE \
        -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
        -D WITH_OPENMP=ON \
        -D WITH_VTK=ON \
        -D BUILD_EXAMPLES=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_TESTS=OFF \
        .. ;
else
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib/modules \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D BUILD_SHARED_LIBS=OFF \
        -D ENABLE_CCACHE=OFF \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D BUILD_JAVA=OFF \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D BUILD_opencv_python3=TRUE \
        -D BUILD_opencv_gpu=OFF \
        -D WITH_OPENMP=ON \
        -D WITH_VTK=ON \
        -D WITH_TBB=ON \
        -D WITH_OPENMP=ON \
        -D BUILD_EXAMPLES=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_TESTS=OFF \
        .. ;
fi