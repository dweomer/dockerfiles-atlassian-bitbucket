#!/bin/sh -e

case "$1" in
    stash)
        if [ -d /srv/stash.d ]; then
            for f in $(find /srv/stash.d -type f | sort); do
                case "$f" in
                    *.sh)   echo "$0: sourcing $f"; . "$f" ;;
                    *)      echo "$0: ignoring $f" ;;
                esac
            done
        fi

        exec ${STASH_INSTALL}/bin/start-stash.sh -fg
    ;;

    *)
        exec "$@"
    ;;
esac
