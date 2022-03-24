#!/usr/bin/env bash

# mirror setup on server
rsync -aP -e "ssh -i $APP_SSHKEY" \
    frontend/dist \
    $APP_USER@$APP_HOST:~/frontend/dist
