FROM golang:1.23.4@sha256:585103a29aa6d4c98bbb45d2446e1fdf41441698bbdf707d1801f5708e479f04 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
