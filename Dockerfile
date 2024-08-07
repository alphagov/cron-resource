FROM golang:1.23rc2@sha256:01dd2262c004dc80a290b501b02885902663c27559c93184461169c5b2038f45 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
