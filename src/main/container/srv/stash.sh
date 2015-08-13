#!/bin/sh -e

if [ -d /srv/stash.d ]; then
    for f in $(find /srv/stash.d -type f | sort); do
        case "$f" in
            *.sh)   echo "$0: sourcing $f"; . "$f" ;;
            *)      echo "$0: ignoring $f" ;;
        esac
    done
fi

case "$1" in
    stash)
        exec ${STASH_INSTALL}/bin/start-stash.sh -fg
    ;;

    *)
        exec "$@"
    ;;
esac
