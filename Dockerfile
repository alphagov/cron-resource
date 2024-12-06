FROM golang:1.23.4@sha256:81e1da9b9604cdee2bc226e90e15f9d51ae6a8cd2271dc341c42ca0926c3b83f as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
