FROM golang:1.22.5@sha256:829eff99a4b2abffe68f6a3847337bf6455d69d17e49ec1a97dac78834754bd6 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM alpine:3.20.1@sha256:b89d9c93e9ed3597455c90a0b88a8bbb5cb7188438f70953fede212a0c4394e0
COPY --from=resource /resource/tmp/build/* /opt/resource/
RUN apk add --no-cache tzdata
