ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

# Without the guard, an empty version installs Alpine's default postgresql-client.
ARG POSTGRES_VERSION
RUN apk add --no-cache bash aws-cli "postgresql${POSTGRES_VERSION:?POSTGRES_VERSION must be set}-client"

WORKDIR /scripts
COPY backup.sh .
ENTRYPOINT [ "/scripts/backup.sh" ]
