FROM golang:1.24.2@sha256:1ecc479bc712a6bdb56df3e346e33edcc141f469f82840bab9f4bc2bc41bf91d as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
