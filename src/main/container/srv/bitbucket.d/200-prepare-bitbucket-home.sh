#!/bin/sh

mkdir -vp ${BITBUCKET_HOME}/lib/native || true
chown -R ${BITBUCKET_UID}:${BITBUCKET_GID} ${BITBUCKET_HOME} || true
