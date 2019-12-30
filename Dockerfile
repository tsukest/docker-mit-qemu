FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    gcc-multilib \
    libsdl1.2-dev \
    libtool-bin \
    libglib2.0-dev \
    libz-dev \
    libpixman-1-dev \
    git \
    python \
    libfdt-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/mit-pdos/6.828-qemu.git qemu
WORKDIR qemu
RUN ./configure --disable-kvm --disable-werror
RUN make && make install
