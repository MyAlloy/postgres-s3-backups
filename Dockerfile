ARG ALPINE_VERSION=3.20
FROM alpine:${ALPINE_VERSION}

ARG POSTGRES_VERSION=14
RUN apk add --no-cache bash aws-cli "postgresql${POSTGRES_VERSION}-client"

WORKDIR /scripts
COPY backup.sh .
ENTRYPOINT [ "/scripts/backup.sh" ]
