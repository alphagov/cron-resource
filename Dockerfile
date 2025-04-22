FROM golang:1.24.2@sha256:d9db32125db0c3a680cfb7a1afcaefb89c898a075ec148fdc2f0f646cc2ed509 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
