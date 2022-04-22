FROM alpine:latest
RUN apk add --no-cache \
    openssh-client \
    ca-certificates \
    bash

# RUN addgroup -g 1000 sshtnl
RUN adduser \
    --disabled-password \
    --gecos "" \
    # --home "$(pwd)" \
    # --ingroup sshtnl \
    # --no-create-home \
    --uid 1000 \
    sshtnl

USER sshtnl

WORKDIR /script

COPY process.sh process.sh

ENTRYPOINT [ "/bin/sh", "/script/process.sh" ]