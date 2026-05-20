FROM golang:1.26.3@sha256:8530a4fd262b294857b6c1d07203f57261863cafe5924f90ebdb4ba96b16ad15 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
