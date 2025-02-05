FROM golang:1.24rc2@sha256:a5ddeaeeec69e764a7a86c6063ceabb4ab0261a448a173ba3ad0dde7b93524d6 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
