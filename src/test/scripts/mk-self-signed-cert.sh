#!/bin/sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout server.key -out server.crt \
    -subj "/C=us/ST=California/L=San Francisco/O=example.com/OU=stash.example.com/CN=stash.example.com/emailAddress=stash@example.com"
