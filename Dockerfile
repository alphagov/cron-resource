FROM golang:1.23.2@sha256:adee809c2d0009a4199a11a1b2618990b244c6515149fe609e2788ddf164bd10 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
