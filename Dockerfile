FROM golang:1.26.1@sha256:318ba178e04ea7655d4e4b1f3f0e81da0da5ff28a2c48681ff0418fb75f5e189 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
