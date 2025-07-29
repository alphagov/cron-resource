FROM golang:1.24.5@sha256:ef5b4be1f94b36c90385abd9b6b4f201723ae28e71acacb76d00687333c17282 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
