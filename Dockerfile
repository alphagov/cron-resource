FROM golang:1.22.5@sha256:1b70fa8200ed48367e7d0e0e82c0c1d14cf712d422116f9d69e7c964243653a0 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
