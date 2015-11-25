#!/bin/sh

sed -e 's/^[#][ ]*umask/umask/g' -i ${BITBUCKET_INSTALL}/bin/setenv.sh || true
