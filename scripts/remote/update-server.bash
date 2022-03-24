#!/usr/bin/env bash
# ARG $1 is 'blue'|'green'

if [[ $# -eq 0 ]] ; then
    echo 'Provide server color as first argument, either "blue" or "green".'
    exit 1
fi

COLOR=$1

# copy data over locally
rsync -aP backend/src backend/dist/$COLOR
rsync -aP env/$COLOR/.env backend/dist/$COLOR/src

# mirror setup on server
rsync -aP -e "ssh -i $APP_SSHKEY" \
    backend/src \
    $APP_USER@$APP_HOST:~/backend/dist/$COLOR
rsync -aP -e "ssh -i $APP_SSHKEY" \
    env/$COLOR/.env \
    $APP_USER@$APP_HOST:~/backend/dist/$COLOR/src