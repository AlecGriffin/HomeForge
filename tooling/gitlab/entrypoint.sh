#!/bin/sh

CONFIG=/etc/gitlab-runner/config.toml
TEMPLATE=/tmp/config.toml

# if [ ! -f /etc/gitlab-runner/config.toml ]; then
gitlab-runner register --non-interactive \
    --template-config "/tmp/config.toml" \
    --url "$CI_SERVER_URL" \
    --token "$REGISTRATION_TOKEN" \
    --executor "docker" \
    --docker-image "alpine:latest" \
    --description "homelab-docker-runner" \
    --tag-list "default" \
# fi

exec gitlab-runner run --working-directory=/home/gitlab-runner