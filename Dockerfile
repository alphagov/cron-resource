FROM golang:1.26rc3@sha256:9726cb96e5091399368426abbecc807d7674ca62dc59757e4cc5bef96a9fd608 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
