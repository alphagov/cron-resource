FROM golang:1.24.1@sha256:8678013a2add364dc3d5df2acc2b36893fbbd60ebafa5d5149bc22158512f021 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
