#!/usr/bin/env bash

SERVICE=$1

docker-compose up --build --force-recreate --no-deps -d $SERVICE