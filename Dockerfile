FROM golang:1.25.3@sha256:2e3aca25948111e2a3e4acd66b5c5abebecdea6a434eead036152631e4d0b3a0 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
