FROM golang:1.23.1@sha256:4a3c2bcd243d3dbb7b15237eecb0792db3614900037998c2cd6a579c46888c1e as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
