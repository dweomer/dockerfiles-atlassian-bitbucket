#!/bin/sh -e

case "$1" in
    bitbucket)
        if [ -d /srv/bitbucket.d ]; then
            set +e
            for f in $(find /srv/bitbucket.d -type f | sort); do
                case "$f" in
                    *.sh)   echo "$0: sourcing $f"; . "$f";;
                    *)      echo "$0: ignoring $f" ;;
                esac
            done
            set -e
        fi
        exec gosu ${BITBUCKET_UID}:${BITBUCKET_GID} ${BITBUCKET_INSTALL}/bin/start-bitbucket.sh -fg
    ;;

    *)
        exec "$@"
    ;;
esac
