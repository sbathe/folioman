#!/bin/bash
podman run --name myregistry \
         -p 5000:5000 \
         -v /opt/registry/data:/var/lib/registry:z \
         -v /opt/registry/auth:/auth:z \
         -e "REGISTRY_AUTH=htpasswd" \
         -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
         -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
         -v /opt/registry/certs:/certs:z \
         -e "REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt" \
         -e "REGISTRY_HTTP_TLS_KEY=/certs/domain.key" \
         -e REGISTRY_COMPATIBILITY_SCHEMA1_ENABLED=true \
         -d \
         docker.io/library/registry:latest
