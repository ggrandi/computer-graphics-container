FROM debian:bookworm-slim

LABEL maintainer="ggrandi"

# APT Update
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    cmake \
    libglu1-mesa \
    libglu1-mesa-dev \
    locales \
    ninja-build \
    xorg \
    xorg-dev

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

