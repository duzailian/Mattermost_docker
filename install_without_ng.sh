#!/bin/bash

cp env.example .env

mm_path=/home/dzl/.bin
sudo rm -rf $mm_path/app
mkdir -p $mm_path/app/mattermost/{config,data,logs,plugins,client/plugins,bleve-indexes}
sudo chown -R 2000:2000 $mm_path/app/mattermost

sed -i "s!./volumes!$mm_path!g" .env


sudo docker compose -f docker-compose.yml -f docker-compose.without-nginx.yml up -d
