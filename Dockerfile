FROM debian:bookworm-slim

LABEL org.opencontainers.image.authors="ggrandi"

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

# set the locale to en_US.UTF-8
RUN echo "en_US.UTF-8 UTF-8" >/etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
