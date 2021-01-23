# docker-opencv
Docker build for OpenCV designed for amd64/x86_64 and ARM architectures.

## About
You can download the image directly through my [Docker Hub repository](https://hub.docker.com/repository/docker/jjhickman/opencv-python). It contains an installation for OpenCV version 4.4.0 with non-free algorithms included. Other third-party libraries include OpenMP, VTK, TBB, GStreamer, and GTK.

The image can either be built with the standard ```docker build``` command, or it can be cross-compiled with ```docker buildx``` for linux/amd64, linux/arm64, and linux/arm/v7 CPU architectures provided you have Docker experimental features enabled. Learn more about buildx here: [buildx](https://docs.docker.com/buildx/working-with-buildx/). It makes a great base to build computer vision, image processing, and machine learning applications.

## Build

**For native host architecure:**
```sh
docker build -t {NAME OF IMAGE} .
```

**For cross-compilation:**
```sh
docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 --push -t {IMAGE REPOSITORY NAME} .
```
