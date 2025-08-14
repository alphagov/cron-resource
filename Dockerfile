FROM golang:1.25.0@sha256:10a15b9d650c559eff6cb070f3177f1e2fc067cd7412e5ca97c9cb8167a924b7 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
