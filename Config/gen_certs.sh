#! /bin/bash

openssl \
req \
-newkey rsa:2048 \
-days 365 \
-nodes \
-x509 \
-subj "/C=US/ST=Texas/L=Austin/O=Homelab/OU=Homelab/CN=*.example.com" \
-keyout ./Data/private/app.key -out ./Data/private/app.crt
