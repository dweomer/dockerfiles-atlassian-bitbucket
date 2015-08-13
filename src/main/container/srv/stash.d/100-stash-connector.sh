#!/bin/sh

STASH_SERVER_XML="${STASH_INSTALL}/conf/server.xml"
STASH_CONNECTOR_SECURE_ATTR="secure"
STASH_CONNECTOR_SCHEME_ATTR="scheme"
STASH_CONNECTOR_PROXY_PORT_ATTR="proxyPort"
STASH_CONNECTOR_PROXY_NAME_ATTR="proxyName"

if [ ! -z "${STASH_CONNECTOR_PROXY_NAME}" ] && [ -z "$(xmlstarlet sel -t -c '//Connector[@proxyName]' ${STASH_SERVER_XML})" ]; then
    STASH_CONNECTOR_SECURE=${STASH_CONNECTOR_SECURE:-true}
    STASH_CONNECTOR_SCHEME=${STASH_CONNECTOR_SCHEME:-https}
    STASH_CONNECTOR_PROXY_PORT=${STASH_CONNECTOR_PROXY_PORT:-443}

    echo "+${STASH_SERVER_XML}://Connector[@port=7990] ${STASH_CONNECTOR_SECURE_ATTR}=\"${STASH_CONNECTOR_SECURE}\""
    echo "+${STASH_SERVER_XML}://Connector[@port=7990] ${STASH_CONNECTOR_SCHEME_ATTR}=\"${STASH_CONNECTOR_SCHEME}\""
    echo "+${STASH_SERVER_XML}://Connector[@port=7990] ${STASH_CONNECTOR_PROXY_PORT_ATTR}=\"${STASH_CONNECTOR_PROXY_PORT}\""
    echo "+${STASH_SERVER_XML}://Connector[@port=7990] ${STASH_CONNECTOR_PROXY_NAME_ATTR}=\"${STASH_CONNECTOR_PROXY_NAME}\""

    xmlstarlet ed --inplace \
            --insert '//Connector[@port=7990]' -t attr -n ${STASH_CONNECTOR_SECURE_ATTR} -v ${STASH_CONNECTOR_SECURE} \
            --insert '//Connector[@port=7990]' -t attr -n ${STASH_CONNECTOR_SCHEME_ATTR} -v ${STASH_CONNECTOR_SCHEME} \
            --insert '//Connector[@port=7990]' -t attr -n ${STASH_CONNECTOR_PROXY_PORT_ATTR} -v ${STASH_CONNECTOR_PROXY_PORT} \
            --insert '//Connector[@port=7990]' -t attr -n ${STASH_CONNECTOR_PROXY_NAME_ATTR} -v ${STASH_CONNECTOR_PROXY_NAME} \
        ${STASH_SERVER_XML}
fi

echo "=${STASH_SERVER_XML}:"
xmlstarlet sel -t -c '//Connector[@port=7990]' ${STASH_SERVER_XML} | fold -s | sed -e '2,$s/^/    /g' -e 's/^/    /g'
echo
