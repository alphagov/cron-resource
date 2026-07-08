FROM golang:1.27rc2@sha256:2317c8e806fe884a0d5f3d80d596dcd1369a4c211b7eba8d507718245e9e5831 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
