FROM ubuntu:20.04

RUN sed -i 's/archive.ubuntu.com/mirrors.tencent.com/g' /etc/apt/sources.list &&\
  sed -i 's/security.ubuntu.com/mirrors.tencent.com/g' /etc/apt/sources.list

# ref: https://github.com/facebook/rocksdb/blob/v8.1.1/INSTALL.md
RUN apt update                                                                            &&\
  apt install -y build-essential git                                                      &&\
  apt install -y libgflags-dev libsnappy-dev libbz2-dev liblz4-dev libzstd-dev zlib1g-dev &&\
  apt clean                                                                               &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /github.com/facebook/rocksdb

ARG ROCKSDB_REV=v8.1.1

RUN git clone -b $ROCKSDB_REV --depth 1 https://github.com/facebook/rocksdb .

RUN make static_lib -j4 && make install PREFIX=/opt/rocksdb
