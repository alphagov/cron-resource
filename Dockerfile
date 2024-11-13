FROM golang:1.23.3@sha256:3694e364a0357a6e885569d3bdd097f7b36839bc4fb0df2af33d411b37e27e59 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
