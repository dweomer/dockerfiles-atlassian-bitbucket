#!/bin/sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout server.key -out server.crt \
    -subj "/C=US/ST=California/L=San Francisco/O=example.com/OU=bitbucket.example.com/CN=bitbucket.example.com/emailAddress=bitbucket@example.com"
