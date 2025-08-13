FROM golang:1.24.6@sha256:034848561f95a942e2163d9017e672f0c65403f699336db4529a908af00dfc98 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
