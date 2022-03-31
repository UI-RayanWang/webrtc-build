# syntax = docker/dockerfile:experimental
FROM ubuntu:20.04

ARG PACKAGE_NAME=debian-11_arm64
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBCONF_NONINTERACTIVE_SEEN=true
ENV LC_ALL=C LANGUAGE=C LANG=C

RUN dpkg --configure -a

RUN apt-get update && apt-get install -qy apt-utils gnupg2

#RUN printf "adding arm64 to dpkg...\n" && \
#    dpkg --add-architecture arm64

RUN printf "installing packages...\n" && \
    apt-get update && \
    apt-get install -y crossbuild-essential-arm64 && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    autoconf \
    automake \
    binfmt-support \
    build-essential \
    curl \
    fakeroot \
    procps \
    git \
    qemu-user-static \
    gnupg2 \
    wget

ENV PACKAGE_DIR "/root/_package/$PACKAGE_NAME"

COPY run.py /root/
COPY VERSION /root/
COPY patches/ /root/patches/
COPY scripts/ /root/scripts/
COPY $PACKAGE_NAME/ /root/$PACKAGE_NAME/
RUN /root/scripts/apt_install_arm.sh
ENV LC_ALL=C.UTF-8
#RUN cd /root && python3 run.py build $PACKAGE_NAME
#RUN cd /root && python3 run.py package $PACKAGE_NAME
#RUN mv $PACKAGE_DIR/webrtc.tar.gz /

#FROM ubuntu:20.04
#COPY --from=builder /webrtc.tar.gz /
CMD ["/bin/bash"]
