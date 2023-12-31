FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install build-essential \
    libssl-dev libgl1 libglib2.0-0 git vim zip unzip wget python3-pip

RUN apt-get update && apt-get -y install \
    libmagickwand-dev libsm6 libxext6 libboost-all-dev \
    software-properties-common libgtk2.0-dev

ENV DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository -y ppa:graphics-drivers/ppa
RUN apt install -y nvidia-settings vulkan vulkan-utils
RUN apt-get install libvulkan-dev glslang-tools cmake -y

# Install Vulkan SDK
RUN wget -qO - http://packages.lunarg.com/lunarg-signing-key-pub.asc | apt-key add -
RUN wget -qO /etc/apt/sources.list.d/lunarg-vulkan-focal.list http://packages.lunarg.com/vulkan/lunarg-vulkan-focal.list
RUN apt update
RUN apt install vulkan-sdk -y

WORKDIR /workspace/