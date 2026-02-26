FROM golang:1.26.0@sha256:9edf71320ef8a791c4c33ec79f90496d641f306a91fb112d3d060d5c1cee4e20 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
