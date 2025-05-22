FROM golang:1.24.3@sha256:1bcf8844d2464a6485c87646f9da684610758eb1a2df63c8a6e7ca47c64f8655 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
