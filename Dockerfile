# syntax=docker/dockerfile:1
FROM golang:1.22-bullseye

WORKDIR /app

RUN apt update -y && apt upgrade -y \
    && apt install -y \
    iproute2 \
    iputils-ping \
    arping \
    netcat \
    sudo \
    git \
    wget \
    zip \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/tinygo-org/tinygo/releases/download/v0.32.0/tinygo_0.32.0_amd64.deb
RUN dpkg -i tinygo_0.32.0_amd64.deb
