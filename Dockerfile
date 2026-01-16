FROM golang:1.26rc2@sha256:6ea9974028bfaaa0251e42468ec037fe21e49275a874914f3b42f58beabc84bf as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
