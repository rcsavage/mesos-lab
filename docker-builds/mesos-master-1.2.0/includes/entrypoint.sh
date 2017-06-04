#!/bin/sh

PRINCIPAL=${PRINCIPAL:-root}

if [ -n "$SECRET" ]; then
    export MESOS_AUTHENTICATE=false
    export MESOS_AUTHENTICATE_SLAVES=false
    touch /tmp/credentials
    chmod 600 /tmp/credentials
    printf '%s %s' "$PRINCIPAL" "$SECRET" > /tmp/credentials
    export MESOS_CREDENTIALS=/tmp/credentials
fi

exec "$@"

