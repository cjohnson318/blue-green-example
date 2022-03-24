#!/usr/bin/env bash
# ARG $1 is 'blue'|'green'

if [[ $# -eq 0 ]] ; then
    echo 'Provide server color as first argument, either "blue" or "green".'
    exit 1
fi

COLOR=$1

ssh -i $APP_SSHKEY $APP_USER@$APP_HOST "./scripts/local/toggle-server.bash $COLOR"
