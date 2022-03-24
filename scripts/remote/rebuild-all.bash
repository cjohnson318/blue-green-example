#!/usr/bin/env bash

ssh -i $APP_SSHKEY $APP_USER@$APP_HOST './scripts/local/rebuild-all.bash'