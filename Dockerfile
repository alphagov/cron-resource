FROM golang:1.23.0@sha256:a400dc7e0a82fb3ffef3736d38edf42c3cc36140d5427d65a19c422d07ba60d9 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
