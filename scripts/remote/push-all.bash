#!/usr/bin/env bash

rsync -aP -e "ssh -i $APP_SSHKEY" \
    backend frontend env nginx scripts \
    $APP_WORKDIR/docker-compose.yaml \
    $APP_WORKDIR/Dockerfile \
    $APP_WORKDIR/Dockerfile.nginx \
    $APP_USER@$APP_HOST:~