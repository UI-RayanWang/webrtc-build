#!/bin/bash

set -ex

apt-get update
apt-get -y upgrade

apt-get -y install tzdata
echo 'Asia/Tokyo' > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

export DEBIAN_FRONTEND=noninteractive

apt-get -y install \
  binutils \
  git \
  libsdl2-dev \
  locales \
  lsb-release \
  python3 \
  python3-setuptools \
  rsync \
  sudo \
  unzip \
  vim \
  wget