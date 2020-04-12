#!/bin/sh
set -Ceux
docker-compose rm -f
sudo rm -rf ./volumes
mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins}
sudo chown -R 2000:2000 ./volumes/app
docker-compose up db
