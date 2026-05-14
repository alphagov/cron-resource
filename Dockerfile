FROM golang:1.26.3@sha256:633d23bf362cb40dd72b4f277288a8929697d77537f9c801b81aeced19b5bdf3 as resource
COPY . /resource
WORKDIR /resource
RUN ./build.sh

FROM scratch
COPY --from=resource /resource/tmp/build/* /opt/resource/
