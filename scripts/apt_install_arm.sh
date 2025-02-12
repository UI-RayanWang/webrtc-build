#!/bin/bash

set -ex

apt-get update
apt-get -y upgrade

# Ubuntu 18.04 では tzdata を noninteractive にしないと実行が止まってしまう
apt-get -y install tzdata
echo 'Asia/Tokyo' > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

export DEBIAN_FRONTEND=noninteractive

apt-get -y install \
  build-essential \
  curl \
  git \
  gtk+-3.0 \
  lbzip2 \
  libgtk-3-dev \
  libstdc++6 \
  locales \
  lsb-release \
  multistrap \
  python \
  python-setuptools \
  python3 \
  python3-setuptools \
  rsync \
  software-properties-common \
  sudo \
  unzip \
  vim \
  xz-utils

# Ubuntu 18.04 で multistrap が動かない問題の修正。
# https://github.com/volumio/Build/issues/348#issuecomment-462271607 を参照
sed -e 's/Apt::Get::AllowUnauthenticated=true/Apt::Get::AllowUnauthenticated=true";\n$config_str .= " -o Acquire::AllowInsecureRepositories=true/' -i /usr/sbin/multistrap

