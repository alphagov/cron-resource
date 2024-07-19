FROM golang:1.22.5@sha256:829eff99a4b2abffe68f6a3847337bf6455d69d17e49ec1a97dac78834754bd6 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM ubuntu:bionic
COPY --from=resource /resource/tmp/build/* /opt/resource/
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y tzdata && rm -rf /var/lib/apt/lists/*
