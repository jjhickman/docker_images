FROM ubuntu:20.04

LABEL description="A full installation of OpenCV for x86/amd64 and ARM architectures with Python3.82. Statically compiled for optimal reuse in multi-stage builds!" vendor="Josh Hickman" version="2.0" maintainer="jjhickman@protonmail.com"

ARG TARGETPLATFORM
ARG OPENCV_VERSION=4.4.0
ARG NUM_THREADS=6

ENV DEBIAN_FRONTEND=noninteractive
ENV PLATFORM="${TARGETPLATFORM}"
WORKDIR /opencv

RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        build-essential cmake git wget unzip libx264-dev \
        libv4l-dev libxvidcore-dev libatlas-base-dev \
        libgstreamer1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev \
        libavcodec58 libavcodec-dev libavformat58 libavformat-dev libavutil-dev libswscale5 libswscale-dev  libavresample-dev \
        libgtk-3-0 libgtk-3-dev libdc1394-22 libdc1394-22-dev libhdf5-103 libhdf5-dev \
        libopenblas-dev libprotobuf-dev libjpeg-dev libpng-dev \
        libtiff-dev libwebp-dev libopenjp2-7-dev \
        libtbb2 libtbb-dev libeigen3-dev tesseract-ocr libtesseract-dev \
        python3-minimal python3-pip python3-numpy python3-dev \
    && cd /tmp/ \
    && wget -q --no-check-certificate https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv.zip \
    && wget -q --no-check-certificate https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib.zip \
    && unzip -qq opencv.zip -d /tmp && rm -rf opencv.zip \
    && unzip -qq opencv_contrib.zip -d /tmp && rm -rf opencv_contrib.zip \
    && mkdir -p /tmp/opencv-${OPENCV_VERSION}/build \
    && cd  /tmp/opencv-${OPENCV_VERSION}/build \
    && echo $PLATFORM; \
    if [[ $PLATFORM == *"arm"* ]] ; then \
        cmake \
            -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-${OPENCV_VERSION}/modules -D OPENCV_ENABLE_NONFREE=ON \
            -D OPENCV_GENERATE_PKGCONFIG=ON  -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
            -D ENABLE_PIC=ON -D ENABLE_CCACHE=OFF -D ENABLE_NEON=ON -D ENABLE_VFPV3=ON \
            -D WITH_JPEG=ON -D WITH_PNG=ON -D WITH_TIFF=ON -D WITH_WEBP=ON -D WITH_ZLIB=ON -D WITH_OPENJPEG=ON \
            -D WITH_IMGCODEC_HDR=ON -D WITH_IMGCODEC_SUNRASTER=ON -D WITH_IMGCODEC_PXM=ON -D WITH_IMGCODEC_PFM=ON -D WITH_ANDROID_MEDIANDK=OFF \
            -D WITH_EIGEN=ON -D WITH_LAPACK=OFF -D WITH_TBB=ON -D WITH_PROTOBUF=ON -D WITH_V4L=ON -D WITH_GSTREAMER=ON \
            -D WITH_FFMPEG=ON -D WITH_GTK=ON -D WITH_QT=OFF -D WITH_CUDA=OFF -D WITH_VTK=OFF -D WITH_OPENMP=ON \
            -D WITH_OPENEXR=OFF -D WITH_OPENCL=OFF -D WITH_OPENGL=ON -D WITH_OPENNI=OFF -D WITH_XINE=OFF -D WITH_GDAL=OFF \
            -D WITH_IPP=OFF -D BUILD_opencv_gpu=OFF -D BUILD_SHARED_LIBS=OFF -D BUILD_JPEG=ON -D BUILD_OPENGL=ON -D BUILD_OPENCL=OFF \
            -D BUILD_OPENJPEG=ON -D BUILD_TIFF=ON -D BUILD_WEBP=ON -D BUILD_PNG=ON -D BUILD_ZLIB=ON -D BUILD_OPENCV_PYTHON3=ON \
            -D BUILD_OPENCV_PYTHON2=OFF -D BUILD_OPENCV_JAVA=OFF -D BUILD_GSTREAMER=ON -D BUILD_FFMPEG=ON -D BUILD_GTK=ON \
            -D BUILD_EIGEN=ON -D BUILD_TESTS=OFF -D BUILD_IPP_IW=OFF -D BUILD_PERF_TESTS=OFF \
            -D BUILD_EXAMPLES=OFF -D BUILD_ANDROID_EXAMPLES=OFF -D BUILD_DOCS=OFF -D BUILD_opencv_apps=OFF -D BUILD_ITT=OFF \
            -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D INSTALL_TESTS=OFF \
            .. ; \
    else \
        cmake \
            -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-${OPENCV_VERSION}/modules -D OPENCV_ENABLE_NONFREE=ON \
            -D OPENCV_GENERATE_PKGCONFIG=ON  -D OPENCV_EXTRA_EXE_LINKER_FLAGS=-latomic \
            -D ENABLE_PIC=ON -D ENABLE_CCACHE=OFF -D ENABLE_NEON=OFF -D ENABLE_VFPV3=OFF \
            -D WITH_JPEG=ON -D WITH_PNG=ON -D WITH_TIFF=ON -D WITH_WEBP=ON -D WITH_ZLIB=ON -D WITH_OPENJPEG=ON \
            -D WITH_IMGCODEC_HDR=ON -D WITH_IMGCODEC_SUNRASTER=ON -D WITH_IMGCODEC_PXM=ON -D WITH_IMGCODEC_PFM=ON -D WITH_ANDROID_MEDIANDK=OFF \
            -D WITH_EIGEN=ON -D WITH_LAPACK=OFF -D WITH_TBB=ON -D WITH_PROTOBUF=ON -D WITH_V4L=ON -D WITH_GSTREAMER=ON \
            -D WITH_FFMPEG=ON -D WITH_GTK=ON -D WITH_QT=OFF -D WITH_CUDA=OFF -D WITH_VTK=OFF -D WITH_OPENMP=ON \
            -D WITH_OPENEXR=OFF -D WITH_OPENCL=OFF -D WITH_OPENGL=ON -D WITH_OPENNI=OFF -D WITH_XINE=OFF -D WITH_GDAL=OFF \
            -D WITH_IPP=OFF -D BUILD_opencv_gpu=OFF -D BUILD_SHARED_LIBS=OFF -D BUILD_JPEG=ON -D BUILD_OPENGL=ON -D BUILD_OPENCL=OFF \
            -D BUILD_OPENJPEG=ON -D BUILD_TIFF=ON -D BUILD_WEBP=ON -D BUILD_PNG=ON -D BUILD_ZLIB=ON -D BUILD_OPENCV_PYTHON3=ON \
            -D BUILD_OPENCV_PYTHON2=OFF -D BUILD_OPENCV_JAVA=OFF -D BUILD_GSTREAMER=ON -D BUILD_FFMPEG=ON -D BUILD_GTK=ON \
            -D BUILD_EIGEN=ON -D BUILD_TESTS=OFF -D BUILD_IPP_IW=OFF -D BUILD_PERF_TESTS=OFF \
            -D BUILD_EXAMPLES=OFF -D BUILD_ANDROID_EXAMPLES=OFF -D BUILD_DOCS=OFF -D BUILD_opencv_apps=OFF -D BUILD_ITT=OFF \
            -D INSTALL_PYTHON_EXAMPLES=OFF -D INSTALL_C_EXAMPLES=OFF -D INSTALL_TESTS=OFF \
            .. ; \
    fi ; \
    make -j $NUM_THREADS \
    && make install \
    && ldconfig \
    && cd / \
    && rm -rf /tmp/* \
    && apt-get -qq purge -y \
        software-properties-common build-essential cmake wget unzip libhdf5-dev \
        libopenblas-dev libprotobuf-dev libjpeg8-dev libpng-dev \
        libtiff-dev libwebp-dev libopenjp2-7-dev libtbb-dev \
        libtesseract-dev python3-dev libv4l-dev libatlas-base-dev \
        libavcodec-dev libavformat-dev libavutil-dev libswscale-dev \
        libxvidcore-dev libavresample-dev libx264-dev \
        libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libdc1394-22-dev \
        libgtk-3-dev \
    && apt-get -qq autoremove \
    && apt-get -qq clean \
    && rm -rf /var/lib/apt/lists/*
    
CMD ["python3","-c","'import cv2; print(cv2.getBuildInformation())'"]