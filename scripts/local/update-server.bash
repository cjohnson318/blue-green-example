#!/usr/bin/env bash

rsync -aP backend/src backend/dist/$1
rsync -ap env/$1/.env backend/dist/$1/src