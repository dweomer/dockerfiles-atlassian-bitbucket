#!/bin/sh +e
#
# SEE https://confluence.atlassian.com/display/STASHKB/The+Atlassian+Marketplace+server+is+not+reachable
#

SSL_HOSTS='
marketplace.atlassian.com
plugins.atlassian.com
dq1dnt4af4eyy.cloudfront.net
'

for h in ${SSL_HOSTS}; do
    openssl s_client -connect ${h}:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /usr/local/share/ca-certificates/${h}.crt
done
