FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y fish g++ make cmake wget libboost-all-dev libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xzf yaml-cpp-0.6.3.tar.gz \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && make install

CMD ["/usr/bin/fish"]
