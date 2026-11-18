FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y fish g++ make cmake wget libboost-all-dev libdeal.ii-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

CMD ["/usr/bin/fish"]
