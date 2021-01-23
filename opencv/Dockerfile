FROM ubuntu
WORKDIR /opencv

ARG TARGETPLATFORM
ENV PLATFORM=${TARGETPLATFORM}
ARG OPENCV_VERSION=4.4.0
ARG CPU_CORES=4
ARG DEBIAN_FRONTEND=noninteractive

COPY configure_opencv.sh .

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    build-essential apt-utils cmake wget git pkg-config gfortran \
    unzip libjpeg-dev libtiff5-dev libavcodec-dev libavformat-dev \
    libswscale-dev libxvidcore-dev libx264-dev libv4l-dev \
    libatlas-base-dev v4l-utils curl libgstreamer1.0-dev \
    libgtk2.0-dev libgtk-3-dev libblas-dev libeigen3-dev liblapack-dev \
    libtbb2 libtbb-dev libpng-dev libtiff-dev libdc1394-22-dev \
    gstreamer1.0-plugins-base  gstreamer1.0-plugins-good python3-dev python3-pip; \
    pip3 install --upgrade pip && pip3 install numpy --no-cache-dir; \
    apt-get clean -qq; \
    rm -rf /var/lib/apt/lists/*; \
    cd /tmp; \
    wget -c -nv --no-check-certificate -O /tmp/opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip; \
    unzip /tmp/opencv.zip; \
    wget -c -nv --no-check-certificate -O /tmp/opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip; \
    unzip /tmp/opencv_contrib.zip; \
    mv /tmp/opencv-${OPENCV_VERSION} /tmp/opencv; \
    mv /tmp/opencv_contrib-${OPENCV_VERSION} /tmp/opencv_contrib; \
    mkdir -p /tmp/opencv/build; \
    chmod +x /opencv/configure_opencv.sh; \
    /opencv/configure_opencv.sh > /opencv/cmake.txt; \
    cd /tmp/opencv/build; \
    make -j ${CPU_CORES}; \
    make install; \
    ldconfig; \
    cd /; \
    rm -rf /tmp/*; \
    apt purge -y cmake wget git unzip libjpeg-dev libtiff5-dev libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev lib4vl-dev libatlas-base-dev curl libgstreamer1,0-dev libgtk2.0-dev libgtk-3-dev libblas-dev libeigen3-dev liblapack-dev libtbb-dev libpng-dev libtiff-dev libdc1394-22-dev; \
    apt clean -qq; \
    rm -rf /var/lib/apt/lists/*

CMD ["python3", "-c", "'import cv2; print(cv2.__version__)'"]
